// import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
// import 'package:library_manage_app/library_app/src/entity/user.dart';
// import 'package:library_manage_app/feature/user/domain/usecase/user_service.dart';

// class UserServiceImpl implements UserService {
//   UserServiceImpl({required this.repository});

//   final DatabaseRepository repository;

//   @override
//   Future<User> createUser({required User user}) async {
//     return await repository.createUser(user: user);
//   }

//   @override
//   Future<void> deleteUser({required User user}) async {
//     await repository.removeUser(user: user);
//   }

//   @override
//   Future<List<User>> getUsers() async {
//     print('UserServiceIpl / getUsers()');
//     return await repository.getUsers();
//   }

//   @override
//   Future<void> updateUser({required User user}) async {}

//   @override
//   List<User> retrieveUserFromName(
//           {required List<User> users, required String name}) =>
//       users.where((user) => user.name.contains(name)).toList();
// }
