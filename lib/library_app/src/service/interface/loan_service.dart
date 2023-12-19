import '../../entity/book.dart';
import '../../entity/user.dart';

abstract interface class LoanService {
  // 도서 대출 수행
  void loanBook({required User user, required Book book});

  // 도서 반납 수행
  void returnBook({required Book book});

  // 대출 연장 수행
  void extendLoan({required Book book});
  
  
}