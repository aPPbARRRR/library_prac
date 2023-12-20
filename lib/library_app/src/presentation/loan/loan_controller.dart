// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:library_manage_app/library_app/src/enums/fileter.dart';

import '../../entity/user.dart';
import '../../service/interface/loan_service.dart';
import '../../service/interface/user_service.dart';

// view에 의존하지 않음
// view에 필요한 부분을 제공

class LoanController {
  final UserService userService;
  final LoanService loanService;
  LoanController({required this.userService, required this.loanService});

  List<User>? users;

  

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

  void loanRequest() {}
}
