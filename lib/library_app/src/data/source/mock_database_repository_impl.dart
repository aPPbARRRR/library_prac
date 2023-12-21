import 'dart:io';

import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';

class MockDatabaseRepositoryImpl implements DatabaseRepository {
  List<User> mockuUserDB = [];
  List<Book> mockBookDB = [];
  List<BookLoan> mockLoanDB = [];

  @override
  Future<User> createUser({required User user}) async {
    mockuUserDB.add(user);
    return user;
  }

  // @override
  // Future<BookLoan>? executeLoan({required User user, required Book book}) async {
  //   BookLoan newLoan = BookLoan(
  //       bookName: book.bookName,
  //       loanUid: user.userUid,
  //       loanDate: DateTime.now(),
  //       dueDate: DateTime.now().add(Duration(days: 14)),
  //       remainingLoanDays: 14);
  //   mockLoanDB.add(newLoan);
  //   return newLoan;
  // }

  @override
  Future<List<BookLoan>> getBookLoans() async {
    return mockLoanDB;
  }

  @override
  Future<List<Book>> getBooks() async {
    return mockBookDB;
  }

  @override
  Future<List<User>> getUsers() async {
    return mockuUserDB;
  }

  @override
  Future<Book> registerBook({required Book book}) async {
     mockBookDB.add(book);
     return book;
  }

  @override
  Future<void> removeUser({required User user}) async {
    mockuUserDB.removeWhere((target) => target.userUid == user.userUid);

  }

  @override
  Future<void> returnBookLoan({required BookLoan bookLoan}) async {
    mockLoanDB.removeWhere((target) => target.loanUid == bookLoan.loanUid);
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
  Future<void> unregisterBook({required Book book}) async {
    mockBookDB.removeWhere((target) => target.bookUid == book.bookUid);
  }
}
