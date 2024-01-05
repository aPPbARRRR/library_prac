// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:library_manage_app/feature/common/domain/model/user.dart';
import 'package:library_manage_app/feature/user/domain/model/user_search_type.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:library_manage_app/shared/drift/model/user_extention.dart';

import '../../../../shared/drift/repository/drift_database.dart';
import '../../domain/repository/user_repository.dart';

class DriftUserRepositoryImpl implements UserRepository {
  DriftUserRepositoryImpl({
    required this.db,
  });

  final AppDatabase db;

  @override
  Future<Result<User, Exception>> createUser({required User user}) async {
    try {
      await db.into(db.userTable).insert(user.toTableCompanion());
      return Success(user);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<User>, Exception>> getUsers() async {
    try {
      List<UserTableData> usersDataTable = await db.select(db.userTable).get();
      return Result.success(
          usersDataTable.map((data) => db.tableDataToUser(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  @override
  Future<Result<void, Exception>> removeUser({required User user}) async {
    try {
      await db.delete(db.userTable)
        ..where((tbl) => tbl.userUid.equals(user.userUid));
      return Success(null);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<User>, Exception>> retrieveUser(
      {required String searchText,
      required UserSearchType userSearchType}) async {
    try {
      List<UserTableData> tempList = [];
      if (userSearchType == UserSearchType.uid) {
        tempList = await (db.select(db.userTable)
              ..where((tbl) => tbl.userUid.contains(searchText)))
            .get();
      } else if (userSearchType == UserSearchType.name) {
        tempList = await (db.select(db.userTable)
              ..where((tbl) => tbl.name.contains(searchText)))
            .get();
      }
      return Success(tempList.map((data) => db.tableDataToUser(data)).toList());
    } catch (e) {
      return Error(Exception(e));
    }
  }
}
