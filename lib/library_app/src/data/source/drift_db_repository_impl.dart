import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/drift/database.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:drift/drift.dart' as d;
import 'package:library_manage_app/library_app/src/entity/user_extention.dart';

class DriftDBRepositoryImpl implements DatabaseRepository {
  final AppDatabase db = AppDatabase();


  @override
  Future<User> createUser({required User user}) async {
    UserTableData? data;
    var result = await db.createUser(user.toTableCompanion());
    if (result == null)
      throw Exception('repository / createUser / result : Failed');
    await db.getUser(user.userUid).then((value) => value.length < 1
        ? throw Exception('repository / createUser / getUser : Failed')
        : data = value[0]);
    return User(
        userUid: data!.userUid,
        name: data!.name,
        address: data!.address,
        phoneNum: data!.phoneNum,
        birthDate: data!.birthDate,
        registrationDate: data!.resistrationDate);
  }

  @override
  Future<List<User>> getUsers() async {
    print('drift repository / getUsers');
    // var allUsersDataTable =await db.select(db.userTable).get();
    List<UserTableData> allUsersDataTable = await db.selectAllUsers();
   return allUsersDataTable.map((userdataTable) => User(
        userUid: userdataTable.userUid,
        name: userdataTable.name,
        address: userdataTable.address,
        phoneNum: userdataTable.phoneNum,
        birthDate: userdataTable.birthDate,
        registrationDate: userdataTable.resistrationDate)).toList();
  }

  @override
  Future<BookLoan> executeLoan({required User user, required Book book}) {
    // TODO: implement executeLoan
    throw UnimplementedError();
  }

  @override
  Future<List<BookLoan>> getBookLoans() {
    // TODO: implement getBookLoans
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<Book> registerBook({required Book book}) {
    // TODO: implement registerBook
    throw UnimplementedError();
  }

  @override
  Future<void> removeUser({required User user}) async {
    await (db.delete(db.userTable)..where((tbl) => tbl.userUid.equals(user.userUid))).go();
  }

  @override
  Future<void> returnBookLoan({required BookLoan bookLoan}) {
    // TODO: implement returnBookLoan
    throw UnimplementedError();
  }

  @override
  Future<File> saveBackUpDataAsCSV(
      {required List<User> users,
      required List<Book> books,
      required List<BookLoan> bookLoans}) {
    // TODO: implement saveBackUpDataAsCSV
    throw UnimplementedError();
  }

  @override
  Future<void> unregisterBook({required Book book}) {
    // TODO: implement unregisterBook
    throw UnimplementedError();
  }
}
