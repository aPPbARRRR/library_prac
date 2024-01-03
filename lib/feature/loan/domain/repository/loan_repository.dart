import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';

abstract interface class LoanRepository {
  Future<BookLoan> executeLoan({required User user, required Book book});

  Future<List<BookLoan>> getBookLoans();

  Future<BookLoan> returnBookLoan({required BookLoan loan});

  Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day});
}
