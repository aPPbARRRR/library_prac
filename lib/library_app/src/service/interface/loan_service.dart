import 'package:library_manage_app/library_app/src/entity/book_loan.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';

abstract interface class LoanService {
  // 도서 대출 수행
  Future<BookLoan> loanBook({required User user, required Book book});

  // 도서 반납 수행
  void returnBook({required BookLoan loan});

  // 대출 연장 수행
  Future<BookLoan> extendLoan({required BookLoan loan, int? day});
  
  // 모든 대출 목록 반환
  Future<List<BookLoan>> getAllLoans ();

    // 대출 이름으로 검색
 List<BookLoan> retrieveLoansFromLoanUid({required List<BookLoan> loans, required String loanUid});
  
}