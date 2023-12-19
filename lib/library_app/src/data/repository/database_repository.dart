import '../../entity/book.dart';
import '../../entity/user.dart';

abstract interface class DatabaseRepository {
  // 리포지터리는 dto를 이용해 변환된 결과값을 반환할 수 있다.
  // 실제로 task 수행하는 임플에서 dto 사용해주면 됨.

  // book 리스트 가져오기. 필터 적용시 인자 받을 것
  Future<List<Book>> getBooks();

  Future<List<User>> getUsers();
}