// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:uuid/uuid.dart';

// import 'package:library_manage_app/feature/book/domain/usecase/book_service.dart';
// import 'package:library_manage_app/feature/loan/domain/usecase/loan_service.dart';
// import 'package:library_manage_app/feature/user/domain/usecase/user_service.dart';

// import '../../../../library_app/src/entity/user.dart';
// import '../../../../library_app/src/presentation/common/view_controller.dart';

// class UserViewController extends ViewController {
//   final UserService userService;
//   final LoanService loanService;
//   final BookService bookService;
//   UserViewController({
//     required this.userService,
//     required this.loanService,
//     required this.bookService,
//   }) : super(
//             userService: userService,
//             loanService: loanService,
//             bookService: bookService);

//   Future<User> createUser(
//       {required String name,
//       required String address,
//       required int phoneNum,
//       required DateTime birthDate}) async {
//     final User tempUser = User(
//         userUid: Uuid().v4(),
//         name: name,
//         address: address,
//         phoneNum: phoneNum,
//         birthDate: birthDate,
//         registrationDate: DateTime.now(),
//         loaningBooks: []);
//     return await userService.createUser(user: tempUser);
//   }

//   Future<void> removeUser(User user) async {
//     await userService.deleteUser(user: user);
//     await super.retrieveUsers();
//   }
// }
