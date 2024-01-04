// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:drift/drift.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';
import 'package:library_manage_app/feature/book/domain/repository/book_repository.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:library_manage_app/shared/drift/model/book_extention.dart';

import '../../../../shared/drift/repository/drift_database.dart';
import '../../../common/domain/model/book.dart';

class DriftBookRepositoryImpl implements BookRepository {
  DriftBookRepositoryImpl({
    required this.db,
  });

  final AppDatabase db;

  @override
  Future<Result<List<Book>, Exception>> getAllBooks() async {
    try {
      List<BookTableData> allBooksDataTable =
          await db.select(db.bookTable).get();
      return Result.success(
          allBooksDataTable.map((data) => db.tableDataToBook(data)).toList());
      // return Success(
      //     allBooksDataTable.map((data) => db.tableDataToBook(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
      // return Error(Exception(e));
    }
  }

  @override
  Future<Result<List<Book>, Exception>> retrieveBooks(
      {required String searchText,
      required BookSearchType bookSearchType}) async {
    try {
      List<BookTableData> tempList = [];
      if (bookSearchType == BookSearchType.uid) {
        tempList = await (db.select(db.bookTable)
              ..where((tbl) => tbl.bookUid.contains(searchText)))
            .get();
      } else if (bookSearchType == BookSearchType.name) {
        tempList = await (db.select(db.bookTable)
              ..where((tbl) => tbl.bookName.contains(searchText)))
            .get();
      } else if (bookSearchType == BookSearchType.author) {
        tempList = await (db.select(db.bookTable)
              ..where((tbl) => tbl.author.contains(searchText)))
            .get();
      }
      return Success(tempList.map((data) => db.tableDataToBook(data)).toList());
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<Book, Exception>> registerBook({required Book book}) async {
    try {
      await db.into(db.bookTable).insert(book.toTableCompanion());
      return Success(book);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<void, Exception>> unregisterBook({required Book book}) async {
    try {
      await db.delete(db.bookTable)
        ..where((tbl) => tbl.bookUid.equals(book.bookUid));
      return Success(null);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<Book, Exception>> updateBook({required Book book}) async {
    try {
      await (db.update(db.bookTable)
            ..where((tbl) => tbl.bookUid.equals(book.bookUid)))
          .write(book.toTableCompanion());
      return Success(book);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  // @override
  // Future<User> createUser({required User user}) async {
  //   UserTableData? data;
  //   var result = await db.createUser(user.toTableCompanion());
  //   if (result == null)
  //     throw Exception('repository / createUser / result : Failed');
  //   await db.getUser(user.userUid).then((value) => value.length < 1
  //       ? throw Exception('repository / createUser / getUser : Failed')
  //       : data = value[0]);
  //   return User(
  //       userUid: data!.userUid,
  //       name: data!.name,
  //       address: data!.address,
  //       phoneNum: data!.phoneNum,
  //       birthDate: data!.birthDate,
  //       registrationDate: data!.resistrationDate);
  // }

  // @override
  // Future<List<User>> getUsers() async {
  //   print('drift repository / getUsers');
  //   // var allUsersDataTable =await db.select(db.userTable).get();
  //   List<UserTableData> allUsersDataTable = await db.selectAllUsers();
  //   return allUsersDataTable
  //       .map((userdataTable) => User(
  //           userUid: userdataTable.userUid,
  //           name: userdataTable.name,
  //           address: userdataTable.address,
  //           phoneNum: userdataTable.phoneNum,
  //           birthDate: userdataTable.birthDate,
  //           registrationDate: userdataTable.resistrationDate))
  //       .toList();
  // }

  // @override
  // Future<List<Book>> getBooks() async {
  //   List<BookTableData> allBooksDataTable = await db.selectAllBooks();
  //   return allBooksDataTable
  //       .map((bookDataTable) => Book(
  //           bookName: bookDataTable.bookName,
  //           bookUid: bookDataTable.bookUid,
  //           publishDate: bookDataTable.publishDate,
  //           isBookLoaned: bookDataTable.isBookLoaned,
  //           author: bookDataTable.author))
  //       .toList();
  // }

  // @override
  // Future<Book> registerBook({required Book book}) async {
  //   BookTableData? data;
  //   var result = await db.into(db.bookTable).insert(book.toTableCompanion());
  //   if (result == null)
  //     throw Exception('repository / resisterBook / result : Failed');
  //   await db.getBook(book.bookUid).then((value) => value.length < 1
  //       ? throw Exception('repository / resisterBook / getBook : Failed')
  //       : data = value[0]);

  //   return Book(
  //       bookName: data!.bookName,
  //       bookUid: data!.bookUid,
  //       publishDate: data!.publishDate,
  //       isBookLoaned: data!.isBookLoaned,
  //       author: data!.author);
  // }

  // @override
  // Future<void> removeUser({required User user}) async {
  //   await (db.delete(db.userTable)
  //         ..where((tbl) => tbl.userUid.equals(user.userUid)))
  //       .go();
  // }

  // @override
  // Future<File> saveBackUpDataAsCSV(
  //     {required List<User> users,
  //     required List<Book> books,
  //     required List<BookLoan> bookLoans}) {
  //   // TODO: implement saveBackUpDataAsCSV
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> unregisterBook({required Book book}) {
  //   // TODO: implement unregisterBook
  //   throw UnimplementedError();
  // }
}
