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


// class LoanServiceImpl implements LoanService {
//   final DatabaseRepository repository;
//   LoanServiceImpl({
//     required this.repository,
//   });

//   @override
//   Future<List<BookLoan>> getAllLoans() async {
//     List<BookLoan> allLoans = await repository.getBookLoans();
//     // allLoans.sort((a, b) => a.remainingLoanDays.compareTo(b.remainingLoanDays)); // 대출기간 짧은 대출이 앞으로 가게 반환함.
//     return allLoans;
//   }

//   @override
//   Future<BookLoan> extendLoan({required BookLoan loan, int? day}) async {
//     if (loan.isExtended) throw Exception('이미 연장된 대출입니다. 다시 연장할 수 없습니다.');
//     BookLoan tempLoan = await repository.extendLoanDueDate(loan: loan);
//     return tempLoan;
//   }

//   @override
//   Future<BookLoan> loanBook({required User user, required Book book}) async {
//     return await repository.executeLoan(user: user, book: book);
//   }

//   @override
//   Future<BookLoan> returnBook({required BookLoan loan}) async {
//     if (loan.isReturned) throw Exception('이미 반납된 대출입니다. 다시 연장할 수 없습니다.');
//     return await repository.returnBookLoan(loan: loan);
//   }

//   @override
//   List<BookLoan> retrieveLoansFromLoanUid(
//           {required List<BookLoan> loans, required String loanUid}) =>
//       loans.where((loan) => loan.loanUid.contains(loanUid)).toList();
// }
