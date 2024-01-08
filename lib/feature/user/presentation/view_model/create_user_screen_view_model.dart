// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/common/domain/model/user.dart';

import 'package:library_manage_app/feature/user/domain/usecase/user_service.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:uuid/uuid.dart';

class CreateUserScreenViewModel extends ChangeNotifier {
  CreateUserScreenViewModel({
    required this.userService,
  });
  final UserService userService;
  DateTime birthDate = DateTime.now();

  void selectBirthDate({required BuildContext context}) async {
    await showDatePicker(
            context: context,
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now())
        .then((value) => value != null ? birthDate = value : birthDate);
    notifyListeners();
  }

  void createUser(
      {required BuildContext context,
      required String name,
      required String address,
      required String phoneNum}) async {
    var result = await userService.createUser(
        user: User(
            userUid: const Uuid().v4(),
            name: name,
            address: address,
            phoneNum: int.parse(phoneNum),
            birthDate: birthDate,
            registrationDate: DateTime.now()));
    if (context.mounted) {
      switch (result) {
        case Success<User, Exception>():
          context.pushNamed(AppRoutes.userSingle, extra: result.result);
        case Error<User, Exception>():
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('회원 등록에 실패하였습니다. ${result.e}}')));
      }
    }
  }
}
