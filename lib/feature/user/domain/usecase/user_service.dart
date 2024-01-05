import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/user.dart';
import '../model/user_search_type.dart';

abstract interface class UserService {
  // 회원 등록
  Future<Result<User, Exception>> createUser({required User user});

  // 회원 정보 수정
  Future<Result<void, Exception>> updateUser({required User user});

  // 회원 탈퇴
  Future<Result<void, Exception>> deleteUser({required User user});

  // 회원 목록 리스트로 제공
  Future<Result<List<User>, Exception>> getUsers();

  // 회원 이름, 등록번호, 연락처로 검색
  Future<Result<List<User>, Exception>> retrieveUser(
      {required String searchText, required UserSearchType userSearchType});
}
