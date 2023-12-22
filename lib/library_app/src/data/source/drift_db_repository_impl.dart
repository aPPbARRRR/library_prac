import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/drift/database.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/entity/book_extention.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan_extention.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:drift/drift.dart' as d;
import 'package:library_manage_app/library_app/src/entity/user_extention.dart';
import 'package:uuid/uuid.dart';

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
    return allUsersDataTable
        .map((userdataTable) => User(
            userUid: userdataTable.userUid,
            name: userdataTable.name,
            address: userdataTable.address,
            phoneNum: userdataTable.phoneNum,
            birthDate: userdataTable.birthDate,
            registrationDate: userdataTable.resistrationDate))
        .toList();
  }

  // 책 대출 실행
  @override
  Future<BookLoan> executeLoan({required User user, required Book book}) async {
    BookLoan loan = BookLoan(
        loanUid: Uuid().v4(),
        bookUid: book.bookUid,
        userUid: user.userUid,
        loanDate: DateTime.now(),
        dueDate: DateTime.now().add(Duration(days: 14)));
    LoanTableData? data;

    // 로컬 db에 데이터 저장
    await db.into(db.loanTable).insert(loan.toTableCompanion());

    // 저장된 데이터를 db에서 꺼내서 return할 지역변수에 저장
    await db.getLoan(loan.loanUid).then((value) => value.length < 1
        ? throw Exception('repository / executeLoan / getLoan : Failed')
        : data = value[0]);

    // return 전 데이터베이스 최신화 : 도서(서고보관중 -> 대여중)
    (db.update(db.bookTable)..where((tbl) => tbl.bookUid.equals(data!.bookUid)))
        .write(BookTableCompanion(isBookLoaned: d.Value(true)));

    // BookLoan 객체 생성하여 return
    return BookLoan(
        loanUid: data!.loanUid,
        bookUid: data!.bookUid,
        userUid: data!.userUid,
        loanDate: data!.loanDate,
        dueDate: data!.dueDate);
  }

  @override
  Future<List<BookLoan>> getBookLoans() async {
    print('drift repository / getBookLoans');
    // var allUsersDataTable =await db.select(db.userTable).get();
    List<LoanTableData> allLoansDataTable = await db.selectAllLoans();
    print('done');
    return allLoansDataTable
        .map((loanDataTable) => BookLoan(
            bookUid: loanDataTable.bookUid,
            dueDate: loanDataTable.dueDate,
            loanDate: loanDataTable.loanDate,
            loanUid: loanDataTable.loanUid,
            userUid: loanDataTable.userUid))
        .toList();
  }

  @override
  Future<List<Book>> getBooks() async {
    print('drift repository / getBooks');
    // var allUsersDataTable =await db.select(db.userTable).get();
    List<BookTableData> allBooksDataTable = await db.selectAllBooks();
    return allBooksDataTable
        .map((bookDataTable) => Book(
            bookName: bookDataTable.bookName,
            bookUid: bookDataTable.bookUid,
            publishDate: bookDataTable.publishDate,
            isBookLoaned: bookDataTable.isBookLoaned))
        .toList();
  }

  @override
  Future<Book> registerBook({required Book book}) async {
    BookTableData? data;
    var result = await db.into(db.bookTable).insert(book.toTableCompanion());
    if (result == null)
      throw Exception('repository / resisterBook / result : Failed');
    await db.getBook(book.bookUid).then((value) => value.length < 1
        ? throw Exception('repository / resisterBook / getBook : Failed')
        : data = value[0]);

    return Book(
        bookName: data!.bookName,
        bookUid: data!.bookUid,
        publishDate: data!.publishDate,
        isBookLoaned: data!.isBookLoaned);
  }

  @override
  Future<void> removeUser({required User user}) async {
    await (db.delete(db.userTable)
          ..where((tbl) => tbl.userUid.equals(user.userUid)))
        .go();
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
