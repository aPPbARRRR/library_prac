// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:library_manage_app/feature/common/domain/model/book.dart';

import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';

import 'package:library_manage_app/feature/common/domain/model/user.dart';
import 'package:drift/drift.dart' as d;
import 'package:library_manage_app/feature/loan/domain/model/loan_search_type.dart';
import 'package:library_manage_app/shared/drift/model/book_loan_extention.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/domain/model/result.dart';
import '../../../../shared/drift/repository/drift_database.dart';
import '../../domain/repository/loan_repository.dart';

class DriftLoanRepositoryImpl implements LoanRepository {
  DriftLoanRepositoryImpl({
    required this.db,
  });

  final AppDatabase db;

  @override
  Future<BookLoan> executeLoan({required User user, required Book book}) async {
    try {
      BookLoan loan = BookLoan(
          loanUid: const Uuid().v4(),
          bookUid: book.bookUid,
          userUid: user.userUid,
          loanDate: DateTime.now(),
          dueDate: DateTime.now().add(const Duration(days: 14)),
          isReturned: false,
          isExtended: false);
      await db.into(db.loanTable).insert(loan.toTableCompanion());
      await (db.update(db.bookTable)
            ..where((tbl) => tbl.bookUid.equals(book.bookUid)))
          .write(const BookTableCompanion(isBookLoaned: d.Value(true)));
      return loan;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day}) async {
    try {
      await (db.update(db.loanTable)
            ..where((tbl) => tbl.loanUid.equals(loan.loanUid)))
          .write(LoanTableCompanion(
              dueDate: d.Value(loan.dueDate.add(Duration(days: day ?? 7))),
              isExtended: const d.Value(true)));
      return loan.copyWith(
          isExtended: true,
          dueDate: loan.dueDate.add(Duration(days: day ?? 7)));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<BookLoan>> getBookLoans() async {
    try {
      List<LoanTableData> allBooksDataTable =
          await db.select(db.loanTable).get();
      return allBooksDataTable.map((data) => db.tableDataToLoan(data)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BookLoan> returnBookLoan({required BookLoan loan}) async {
    try {
      await (db.update(db.loanTable)
            ..where((tbl) => tbl.loanUid.equals(loan.bookUid)))
          .write(const LoanTableCompanion(isReturned: d.Value(true)));
      await (db.update(db.bookTable)
            ..where((tbl) => tbl.bookUid.equals(loan.bookUid)))
          .write(const BookTableCompanion(isBookLoaned: d.Value(false)));
      return loan.copyWith(isReturned: true);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<BookLoan>> retrieveLoans(
      {required String searchText,
      required LoanSearchType loanSearchType}) async {
    try {
      List<LoanTableData> tempList = [];
      if (loanSearchType == LoanSearchType.uid) {
        tempList = await (db.select(db.loanTable)
              ..where((tbl) => tbl.loanUid.contains(searchText)))
            .get();
      } else if (loanSearchType == LoanSearchType.userUid) {
        tempList = await (db.select(db.loanTable)
              ..where((tbl) => tbl.userUid.contains(searchText)))
            .get();
      } else if (loanSearchType == LoanSearchType.bookUid) {
        tempList = await (db.select(db.loanTable)
              ..where((tbl) => tbl.bookUid.contains(searchText)))
            .get();
      }
      return tempList.map((data) => db.tableDataToLoan(data)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
