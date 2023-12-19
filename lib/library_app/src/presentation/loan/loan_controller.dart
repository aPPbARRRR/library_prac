// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../entity/user.dart';
import '../../service/interface/loan_service.dart';
import '../../service/interface/user_service.dart';

// view에 의존하지 않음
// view에 필요한 부분을 제공

class LoanController {
  final UserService userService;
  final LoanService loanService;
  LoanController({
    required this.userService,required this.loanService
  });

  List<User>? users;

  Future<void> retrieveUsers () async =>
    users = await userService.getUsers();
  

  Future refreshUsers ({String? name}) async {
    if(name != null && name != '') return userService.retrieveUserFromName(name: name);
    return userService.getUsers();
  }

  void loanRequest () {
    
  }
}
