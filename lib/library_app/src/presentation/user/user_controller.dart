// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';
import 'package:uuid/uuid.dart';

import '../../entity/user.dart';

class UserController {
  final UserService userService;
  UserController({
    required this.userService,
  });

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
}
