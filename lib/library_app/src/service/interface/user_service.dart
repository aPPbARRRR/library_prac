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
  Future<List<User>> retrieveUserFromName({required String name});
}
