import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';
import 'package:library_manage_app/feature/common/domain/model/user.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';

import '../../../../shared/drift/repository/drift_database.dart';
import '../model/user_search_type.dart';
import '../repository/user_repository.dart';
import 'user_service.dart';
import '../../data/repository_impl/drift_user_repository_impl.dart';

class UserServiceProvider extends ChangeNotifier {
  UserServiceProvider({
    required this.db,
  }) : userService =
            UserServiceImpl(repository: DriftUserRepositoryImpl(db: db));

  final AppDatabase db;
  final UserService userService;
}

class UserServiceImpl implements UserService {
  UserServiceImpl({required this.repository});

  final UserRepository repository;

  @override
  Future<Result<User, Exception>> createUser({required User user}) async {
    var result = await repository.createUser(user: user);
    switch (result) {
      case Success<User, Exception>():
        return Success(result.result);
      case Error<User, Exception>():
        return Error(Exception(result.e));
    }
  }

  @override
  Future<Result<void, Exception>> deleteUser({required User user}) async {
    var result = await repository.removeUser(user: user);
    switch (result) {
      case Success<void, Exception>():
        return Success(null);
      case Error<void, Exception>():
        return Error(Exception(result.e));
    }
  }

  @override
  Future<Result<List<User>, Exception>> getUsers() async {
    var result = await repository.getUsers();
    switch (result) {
      case Success<List<User>, Exception>():
        return Success(result.result);
      case Error<List<User>, Exception>():
        return Error(Exception(result.e));
    }
  }

  @override
  Future<Result<List<User>, Exception>> retrieveUser(
      {required String searchText,
      required UserSearchType userSearchType}) async {
    var result = await repository.retrieveUser(
        searchText: searchText, userSearchType: userSearchType);
    switch (result) {
      case Success<List<User>, Exception>():
        return Success(result.result);
      case Error<List<User>, Exception>():
        return Error(Exception(result.e));
    }
  }

  @override
  Future<Result<void, Exception>> updateUser({required User user}) async {
    // var result = await repository.updateUser(user);
    //  switch (result) {
    //   case Success<void, Exception>():
    //     return Success(null);
    //   case Error<void, Exception>():
    //     return Error(Exception(result.e));
    throw Exception();
  }

  @override
  Future<Result<List<BookLoan>, Exception>> retrieveLoans(
      {required String searchText}) {
    // TODO: implement retrieveLoans
    throw UnimplementedError();
  }
}
