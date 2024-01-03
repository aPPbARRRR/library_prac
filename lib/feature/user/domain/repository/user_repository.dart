import '../../../common/domain/model/user.dart';

abstract interface class UserRepository {
  // 도서관 전체 회원 목록 반환
  Future<List<User>> getUsers();

  // 회원 등록
  Future<User> createUser({required User user});

  // 회원 삭제
  Future<void> removeUser({required User user});
}
