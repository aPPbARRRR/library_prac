// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import '../../service/interface/book_service.dart';
import '../../service/interface/loan_service.dart';
import '../../service/interface/user_service.dart';

class ViewController {
  final UserService userService;
  final LoanService loanService;
  final BookService bookService;

  List<User>? users;
  List<Book>? books;
  List<BookLoan>? loans;
  ViewController({
    required this.userService,
    required this.loanService,
    required this.bookService,
    this.users,
    this.books,
    this.loans,
  });

  Future<void> retrieveUsers() async => users = await userService.getUsers();
  Future<void> retrieveBooks() async => books = await bookService.getBooks();
  Future<void> retrieveLoans() async => loans = await loanService.getAllLoans();

  Future<void> refreshAllDataFromDB() async => Future.wait([retrieveBooks(), retrieveLoans(), retrieveUsers()]);

  List<User> retrieveUserFromName({String? name}) {
    return userService.retrieveUserFromName(
        users: this.users ?? [], name: name ?? '');
  }

  List<Book> retrieveBooksFromName({String? bookName}) {
    return bookService.retrieveBooksFromName(
        books: this.books ?? [], bookName: bookName ?? '');
  }

  List<BookLoan> retrieveLoansFromLoanUid({String? loanUid}) {
    return loanService.retrieveLoansFromLoanUid(
        loans: this.loans ?? [], loanUid: loanUid ?? '');
  }
}
