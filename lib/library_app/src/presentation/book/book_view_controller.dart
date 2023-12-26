// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:uuid/uuid.dart';

import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/loan_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

import '../../entity/user.dart';
import '../common/view_controller.dart';

class BookViewController extends ViewController {
  final UserService userService;
  final LoanService loanService;
  final BookService bookService;
  BookViewController({
    required this.userService,
    required this.loanService,
    required this.bookService,
  }) : super(userService: userService, loanService: loanService, bookService: bookService);

  Future<Book> resisterBook(
      {required   String bookName,
      required String author,
  required DateTime publishDate,}) async {
    final Book tempBook = Book(bookName: bookName, bookUid: Uuid().v4(), publishDate: publishDate, isBookLoaned: false, author: author);
     return await bookService.resisterBook(book: tempBook);
     

  }

// 유저 -> 북 수정 요
  Future<void> removeUser(User user) async {
    await userService.deleteUser(user: user);
    await super.retrieveUsers();
  }
}
