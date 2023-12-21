import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/drift/database.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:drift/drift.dart' as d;

class DriftDBRepositoryImpl implements DatabaseRepository {
  AppDatabase db = AppDatabase();
  @override
  Future<User> createUser({required User user}) async {
    var result = await db.createUser(UserTableCompanion(
        userUid: d.Value(user.userUid),
        name: d.Value(user.name),
        address: d.Value(user.address),
        birthDate: d.Value(user.birthDate),
        phoneNum: d.Value(user.phoneNum),
        resistrationDate: d.Value(user.registrationDate)));

    List<UserTableData> res =
        await db.getUser(user.userUid); // uid 일치하면 모두 같은 유저이므로 [0]만 건지면 됨.
    UserTableData userTableData = res[0];

    // dto 만들 필요 없이 바로 매핑...?
    user = User(
        userUid: userTableData.userUid,
        name: userTableData.name,
        address: userTableData.address,
        phoneNum: userTableData.phoneNum,
        birthDate: userTableData.birthDate,
        registrationDate: userTableData.resistrationDate,
        loaningBooks: []);

    return user;
    // throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    DataTable allUsersDataTable = await db.selectAllUsers();
    print(allUsersDataTable);
    print(allUsersDataTable.runtimeType);

    return [];
    throw UnimplementedError();
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
  Future<void> removeUser({required User user}) {
    // TODO: implement removeUser
    throw UnimplementedError();
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
