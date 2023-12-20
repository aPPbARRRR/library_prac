import 'package:library_manage_app/library_app/src/enums/fileter.dart';

import '../../entity/user.dart';

abstract interface class UserService {
  // 회원 등록
  void createUser({required User user});

  // 회원 정보 수정
  void updateUser({required User user});

  // 회원 탈퇴
  void deleteUser({required User user});

  // 회원 목록 리스트로 제공
  Future<List<User>> getUsers();

  // 회원 이름으로 검색
<<<<<<< HEAD
 List<User> retrieveUserFromName({required List<User> users, required String name});
=======
  Future<List<User>> retrieveUsers({required List<User> users, required UserSearchFilter searchFilter, SortFilter? sortFilter,String? searchString});
>>>>>>> main
}
