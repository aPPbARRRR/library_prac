// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/loan/domain/usecase/loan_service_impl.dart';
import 'package:library_manage_app/feature/user/domain/usecase/user_service_impl.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:provider/provider.dart';

import '../../../common/domain/model/user.dart';

class UserSingleViewModel extends ChangeNotifier {
  UserSingleViewModel({
    required this.user,
  });
  final User user;

  void deleteUser(BuildContext context) async {
    var result = await context
        .read<UserServiceProvider>()
        .userService
        .deleteUser(user: user);
    if (context.mounted) {
      switch (result) {
        case Success<void, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('회원이 삭제되었습니다.')));
          context.pop();
        case Error<void, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('회원 삭제 실패, ${result.e}')));
      }
    }
  }
}
