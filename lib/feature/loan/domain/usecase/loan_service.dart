import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';
import '../model/loan_search_type.dart';

abstract interface class LoanService {
  // 도서 대출 수행
  Future<Result<BookLoan, Exception>> loanBook(
      {required User user, required Book book});

  // 도서 반납 수행
  Future<Result<BookLoan, Exception>> returnBook({required BookLoan loan});

  // 대출 연장 수행
  Future<Result<BookLoan, Exception>> extendLoan(
      {required BookLoan loan, int? day});

  // 모든 대출 목록 반환
  Future<Result<List<BookLoan>, Exception>> getAllLoans();

  // 대출 번호로 검색
  Future<Result<List<BookLoan>, Exception>> retrieveLoans(
      {required String searchText, required LoanSearchType loanSearchType});
}
