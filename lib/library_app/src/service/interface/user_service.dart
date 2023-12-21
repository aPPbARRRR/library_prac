import '../../entity/user.dart';

abstract interface class UserService {
  // 회원 등록
  Future<User> createUser({required User user});

  // 회원 정보 수정
  Future<void> updateUser({required User user});

  // 회원 탈퇴
  Future<void> deleteUser({required User user});

  // 회원 목록 리스트로 제공
  Future<List<User>> getUsers();

  // 회원 이름으로 검색
 List<User> retrieveUserFromName({required List<User> users, required String name});
}
