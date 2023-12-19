import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl({required this.repository});

  final DatabaseRepository repository;

  @override
  void createUser({required User user}) {
    // TODO: implement createUser
  }

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
  Future<List<User>> retrieveUserFromName({required String name})  =>
      getUsers().then(
          (users) => users.where((user) => user.name.contains(name)).toList());
}

@override
void updateUser({required User user}) {}
