import 'package:flutter/material.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';
import '../../domain/usecase/loan_service.dart';
import '../../domain/repository/loan_repository.dart';
import '../data_source/drift_loan_repository_impl.dart';

class LoanServiceProvider extends ChangeNotifier {
  final LoanService bookService =
      LoanServiceImpl(repository: DriftLoanRepositoryImpl());
}

class LoanServiceImpl implements LoanService {
  LoanServiceImpl({required this.repository});

  final LoanRepository repository;

  // 리스트<북> 을 반환하는 함수의 경우, 검색결과 없는 경우를 고려해서 반영해야함.

  // @override
  // Future<void> deleteBook({required Book book}) async {
  //   try {
  //     await repository.unregisterBook(book: book);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  Future<BookLoan> extendLoan({required BookLoan loan, int? day}) {
    // TODO: implement extendLoan
    throw UnimplementedError();
  }

  @override
  Future<List<BookLoan>> getAllLoans() {
    // TODO: implement getAllLoans
    throw UnimplementedError();
  }

  @override
  Future<BookLoan> loanBook({required User user, required Book book}) {
    // TODO: implement loanBook
    throw UnimplementedError();
  }

  @override
  List<BookLoan> retrieveLoansFromLoanUid(
      {required List<BookLoan> loans, required String loanUid}) {
    // TODO: implement retrieveLoansFromLoanUid
    throw UnimplementedError();
  }

  @override
  Future<BookLoan> returnBook({required BookLoan loan}) {
    // TODO: implement returnBook
    throw UnimplementedError();
  }
}
