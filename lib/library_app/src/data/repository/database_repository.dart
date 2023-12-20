import '../../entity/book.dart';
import '../../entity/book_loan.dart';
import '../../entity/user.dart';

abstract interface class DatabaseRepository {
  // 리포지터리는 dto를 이용해 변환된 결과값을 반환할 수 있다.
  // 실제로 task 수행하는 임플에서 dto 사용해주면 됨.

  Future<List<Book>> getBooks();
  Future<List<User>> getUsers();
  Future<List<BookLoan>> getBookLoans();
  Future<BookLoan> executeLoan({required User user, required Book book});
  Future<void> returnBookLoan({required BookLoan bookLoan});
  Future<User> createUser({required User user});

  Future<void> saveBackUpData(
      {required List<User> users,
      required List<Book> books,
      required List<BookLoan> bookLoans});
}
