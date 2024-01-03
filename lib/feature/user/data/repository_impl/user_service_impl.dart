import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/domain/model/user.dart';

import '../../domain/repository/user_repository.dart';
import '../../domain/usecase/user_service.dart';
import '../data_source/drift_user_repository_impl.dart';

class UserServiceProvider extends ChangeNotifier {
  final UserService userService =
      UserServiceImpl(repository: DriftUserRepositoryImpl());
}

class UserServiceImpl implements UserService {
  UserServiceImpl({required this.repository});

  final UserRepository repository;

  @override
  Future<User> createUser({required User user}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser({required User user}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  List<User> retrieveUserFromName(
      {required List<User> users, required String name}) {
    // TODO: implement retrieveUserFromName
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  // 리스트<북> 을 반환하는 함수의 경우, 검색결과 없는 경우를 고려해서 반영해야함.
}
