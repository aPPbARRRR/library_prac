// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/user.dart';
import '../../domain/model/user_search_type.dart';
import '../../domain/usecase/user_service.dart';

class UserSearchScreenViewModel extends ChangeNotifier {
  UserSearchScreenViewModel({required this.userService});

  final UserService userService;

  List<User>? resultUsers;

  UserSearchType currentUserSearchType = UserSearchType.name;
  bool isExpirationDateBasedSort = true;
  bool isAscendingSorted = false;

  String get searchHintText => '회원 이름을 입력해주세요.';

  void onTileTapped({required User user, required BuildContext context}) {
    context.pushNamed(AppRoutes.userSingle, extra: user);
  }

  Future<void> search(
      {required String searchText, required BuildContext context}) async {
    var result = await userService.retrieveUser(
        searchText: searchText, userSearchType: currentUserSearchType);
    if (context.mounted) {
      switch (result) {
        case Success<List<User>, Exception>():
          resultUsers = result.result;
          notifyListeners();
        case Error<List<User>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.e.toString())));
      }
    }
  }

  Future<void> getAllUsers({required BuildContext context}) async {
    var result = await userService.getUsers();

    if (context.mounted) {
      switch (result) {
        case Success<List<User>, Exception>():
          if (resultUsers != result.result) {
            resultUsers = result.result;
            notifyListeners();
          }
        case Error<List<User>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.e.toString())));
      }
    }
  }
}
