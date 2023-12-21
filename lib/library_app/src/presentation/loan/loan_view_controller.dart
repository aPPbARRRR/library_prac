// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:library_manage_app/library_app/src/presentation/common/view_controller.dart';
import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import '../../service/interface/loan_service.dart';
import '../../service/interface/user_service.dart';

// view에 의존하지 않음
// view에 필요한 부분을 제공

class LoanViewController extends ViewController {
  LoanViewController({required super.userService, required super.loanService, required super.bookService});


  Future getUsers() async {
    return userService.getUsers();
  }

  Future getBooks() async {
    return bookService.getBooks();
  }
  


  void loanRequest() {}
}
