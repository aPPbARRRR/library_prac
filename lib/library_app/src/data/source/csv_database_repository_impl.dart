import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import 'package:path_provider/path_provider.dart';

import '../../entity/book.dart';

class CSVdatabaseRepositoryImpl implements DatabaseRepository {
  @override
  Future<List<Book>> getBooks() async {
    // csv 를 읽어서 String 가져옴
    // String 값을 json으로 변환
    // json to model (dto) 하여 List<Book>으로 만들어줌
    // 모든 책 리스트 반환함(필터 적용시 필터 적용한 결과)

    // 예외처리 어떻게 할 것인지결정할것. 리절트 패턴 사용할 것인지?
    return mockBookList;
  }

  @override
  Future<List<User>> getUsers() async {
      final dbFolder = await getApplicationDocumentsDirectory();
    final File userCSV =  File(p.join(dbFolder.path, 'user.csv'));
    try {
      await userCSV.readAsString().then((value) => print(jsonDecode(value)));
          
    } catch (e) {
      throw Exception(e);
    }
    
    return mockUserList;
  }

  @override
  Future<List<BookLoan>> getBookLoans() async {
<<<<<<< HEAD
    return [];
  }

  @override
  Future<BookLoan> executeLoan({required User user, required Book book}) {
    // TODO: implement executeLoan
    throw UnimplementedError();
  }

  @override
  Future<void> returnBookLoan({required BookLoan bookLoan}) {
    // TODO: implement returnBookLoan
    throw UnimplementedError();
  }

  @override
  Future<void> saveBackUpData(
      {required List<User> users,
      required List<Book> books,
      required List<BookLoan> bookLoans}) {
    // TODO: implement saveBackUpData
    throw UnimplementedError();
  }

  @override
  Future<User> createUser({required User user}) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final File userCSV =  File(p.join(dbFolder.path, 'user.csv'));
    try {
      await userCSV.writeAsString(jsonEncode(user.toJson()),
          mode: FileMode.append);
          
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  @override
  Future<Book> registerBook({required Book book}) {
    // TODO: implement registerBook
    throw UnimplementedError();
  }

  @override
  Future<User> removeUser({required User user}) {
    // TODO: implement removeUser
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
=======
    return mockLoans;
>>>>>>> main
  }
}

List<Book> mockBookList = List.generate(
    5,
    (i) => Book(
        bookName: i.toString(),
        bookUid: i.toString(),
        publishDate: DateTime(2023, 10, 5),
        isBookLoaned: false));

List<User> mockUserList = List.generate(
    5,
    (i) => User(
        userUid: i.toString(),
        name: i.toString(),
        address: i.toString(),
        phoneNum: i,
        birthDate: DateTime(2000, 11, 23),
        registrationDate: DateTime(2020, 11, 23),
        loaningBooks: []));

List<BookLoan> mockLoans = List.generate(
    5,
    (i) => BookLoan(
        bookName: i.toString(),
        userUid: i.toString(),
        loanDate: DateTime(2023, 12, 23),
        dueDate: DateTime(2023, 12, 30),
        remainingLoanDays: 7));
