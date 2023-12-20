import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl({required this.repository});

  final DatabaseRepository repository;

  @override
  Future<User> createUser({required User user})async {
 return await repository.createUser(user: user);  }

  @override
  void deleteUser({required User user}) {
    // TODO: implement deleteUser
  }

  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return await repository.getUsers();
  }
  // 테스트용 딜레이 삭제할 것...

  @override
  void updateUser({required User user}) {}

  @override
  List<User> retrieveUserFromName(
          {required List<User> users, required String name}) =>
      users.where((user) => user.name.contains(name)).toList();

}
