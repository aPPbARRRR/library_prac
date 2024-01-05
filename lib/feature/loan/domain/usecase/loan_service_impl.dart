// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/feature/loan/domain/model/loan_search_type.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';

import '../../../../shared/drift/repository/drift_database.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';
import '../../data/data_source/drift_loan_repository_impl.dart';
import '../repository/loan_repository.dart';
import 'loan_service.dart';

class LoanServiceProvider extends ChangeNotifier {
  final AppDatabase db;
  final LoanService loanService;
  LoanServiceProvider({
    required this.db,
  }) : loanService =
            LoanServiceImpl(repository: DriftLoanRepositoryImpl(db: db));
}

class LoanServiceImpl implements LoanService {
  LoanServiceImpl({required this.repository});

  final LoanRepository repository;

  @override
  Future<Result<BookLoan, Exception>> extendLoan(
      {required BookLoan loan, int? day}) async {
    try {
      var result = await repository.extendLoanDueDate(loan: loan, day: day);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<BookLoan>, Exception>> getAllLoans() async {
    try {
      var result = await repository.getBookLoans();
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<BookLoan, Exception>> loanBook(
      {required User user, required Book book}) async {
    try {
      var result = await repository.executeLoan(user: user, book: book);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<BookLoan>, Exception>> retrieveLoans(
      {required String searchText,
      required LoanSearchType loanSearchType}) async {
    try {
      var result = await repository.retrieveLoans(
          searchText: searchText, loanSearchType: loanSearchType);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<BookLoan, Exception>> returnBook(
      {required BookLoan loan}) async {
    if (loan.isReturned) {
      throw Exception('이미 반납된 대출입니다. 다시 연장할 수 없습니다.');
    }
    try {
      var result = await repository.returnBookLoan(loan: loan);
      return Success(result);
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
