// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:library_manage_app/feature/common/domain/model/book.dart';

import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';

import 'package:library_manage_app/feature/common/domain/model/user.dart';

import '../../domain/repository/loan_repository.dart';

class DriftLoanRepositoryImpl implements LoanRepository {
  @override
  Future<BookLoan> executeLoan({required User user, required Book book}) {
    // TODO: implement executeLoan
    throw UnimplementedError();
  }

  @override
  Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day}) {
    // TODO: implement extendLoanDueDate
    throw UnimplementedError();
  }

  @override
  Future<List<BookLoan>> getBookLoans() {
    // TODO: implement getBookLoans
    throw UnimplementedError();
  }

  @override
  Future<BookLoan> returnBookLoan({required BookLoan loan}) {
    // TODO: implement returnBookLoan
    throw UnimplementedError();
  }

  // // 책 대출 실행
  // @override
  // Future<BookLoan> executeLoan({required User user, required Book book}) async {
  //   BookLoan loan = BookLoan(
  //       loanUid: Uuid().v4(),
  //       bookUid: book.bookUid,
  //       userUid: user.userUid,
  //       loanDate: DateTime.now(),
  //       dueDate: DateTime.now().add(Duration(days: 14)),
  //       isReturned: false,
  //       isExtended: false);
  //   LoanTableData? data;

  //   // 로컬 db에 데이터 저장
  //   await db.into(db.loanTable).insert(loan.toTableCompanion());

  //   // 저장된 데이터를 db에서 꺼내서 return할 지역변수에 저장
  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);

  //   // return 전 데이터베이스 최신화 : 도서(서고보관중 -> 대여중)
  //   await (db.update(db.bookTable)
  //         ..where((tbl) => tbl.bookUid.equals(data!.bookUid)))
  //       .write(BookTableCompanion(isBookLoaned: d.Value(true)));

  //   // BookLoan 객체 생성하여 return
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }

  // @override
  // Future<List<BookLoan>> getBookLoans() async {
  //   List<LoanTableData> allLoansDataTable = await db.selectAllLoans();
  //   return allLoansDataTable
  //       .map((loanDataTable) => BookLoan(
  //           bookUid: loanDataTable.bookUid,
  //           dueDate: loanDataTable.dueDate,
  //           loanDate: loanDataTable.loanDate,
  //           loanUid: loanDataTable.loanUid,
  //           userUid: loanDataTable.userUid,
  //           isReturned: loanDataTable.isReturned,
  //           isExtended: loanDataTable.isExtended))
  //       .toList();
  // }

  // @override
  // Future<BookLoan> returnBookLoan({required BookLoan loan}) async {
  //   LoanTableData? data;

  //   await (db.update(db.loanTable)
  //         ..where((tbl) => tbl.loanUid.equals(loan.loanUid)))
  //       .write(LoanTableCompanion(isReturned: d.Value(true)));

  //   // return 전 데이터베이스 최신화 : 도서(대여중 -> 서고보관중)
  //   await (db.update(db.bookTable)
  //         ..where((tbl) => tbl.bookUid.equals(loan.bookUid)))
  //       .write(BookTableCompanion(isBookLoaned: d.Value(false)));

  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }

  // @override
  // Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day}) async {
  //   LoanTableData? data;
  //   await (db.update(db.loanTable)
  //         ..where((tbl) => tbl.loanUid.equals(loan.loanUid)))
  //       .write(LoanTableCompanion(
  //           dueDate: d.Value(loan.dueDate.add(Duration(days: day ?? 7))),
  //           isExtended: d.Value(true)));
  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }
}
