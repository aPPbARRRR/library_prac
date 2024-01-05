import 'package:library_manage_app/shared/domain/model/result.dart';

import '../../../common/domain/model/user.dart';
import '../model/user_search_type.dart';

abstract interface class UserRepository {
  // 도서관 전체 회원 목록 반환
  Future<Result<List<User>, Exception>> getUsers();

  // 회원 등록
  Future<Result<User, Exception>> createUser({required User user});

  // 회원 삭제
  Future<Result<void, Exception>> removeUser({required User user});

  // 회원 검색
  Future<Result<List<User>, Exception>> retrieveUser(
      {required String searchText, required UserSearchType userSearchType});
}
