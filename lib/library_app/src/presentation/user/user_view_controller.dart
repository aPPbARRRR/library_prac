// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/loan_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

import '../../entity/user.dart';
import '../common/view_controller.dart';

class UserViewController extends ViewController {
  final UserService userService;
  final LoanService loanService;
  final BookService bookService;
  UserViewController({
    required this.userService,
    required this.loanService,
    required this.bookService,
  }) : super(userService: userService, loanService: loanService, bookService: bookService);

  void createUser(
      {required String name,
      required String address,
      required int phoneNum,
      required DateTime birthDate}) {
    final User tempUser = User(
        userUid: Uuid().v4(),
        name: name,
        address: address,
        phoneNum: phoneNum,
        birthDate: birthDate,
        registrationDate: DateTime.now(),
        loaningBooks: []);
     userService.createUser(user: tempUser);
  }

  void removeUser(User user) {
    userService.deleteUser(user: user);
  }
}
