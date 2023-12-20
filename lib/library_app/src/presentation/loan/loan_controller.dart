// ignore_for_file: public_member_api_docs, sort_constructors_first

<<<<<<< HEAD
import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';
=======
import 'package:library_manage_app/library_app/src/enums/fileter.dart';
>>>>>>> main

import '../../entity/book.dart';
import '../../entity/user.dart';
import '../../service/interface/loan_service.dart';
import '../../service/interface/user_service.dart';

// view에 의존하지 않음
// view에 필요한 부분을 제공

class LoanController {
  final UserService userService;
  final LoanService loanService;
<<<<<<< HEAD
  final BookService bookService;
  LoanController(
      {required this.userService,
      required this.loanService,
      required this.bookService});
=======
  LoanController({required this.userService, required this.loanService});
>>>>>>> main

  List<User>? users;
  List<Book>? books;

<<<<<<< HEAD
  Future<void> retrieveUsers() async => users = await userService.getUsers();

  Future<void> retrieveBooks() async => books = await bookService.getBooks();

  Future getUsers() async {
    return userService.getUsers();
  }

  Future getBooks() async {
    return bookService.getBooks();
  }
  

  List<User> retrieveUserFromName({String? name}) {
    return userService.retrieveUserFromName(
        users: this.users ?? [], name: name ?? '');
  }

  List<Book> retrieveBooksFromName({String? bookName}) {
    return bookService.retrieveBooksFromName(
        books: this.books ?? [], bookName: bookName ?? '');
  }
=======
  

  Future refreshUsers({String? name}) async {
    return userService.getUsers();
  }

  Future<List<User>>? retrieveUsers({
    required List<User> users,
    required UserSearchFilter searchFilter,
    SortFilter? sortFilter,
    String? searchString,
  }) async =>
      await userService.retrieveUsers(users: users, searchFilter: searchFilter);
>>>>>>> main

  void loanRequest() {}
}
