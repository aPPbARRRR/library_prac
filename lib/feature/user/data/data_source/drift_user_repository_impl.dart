// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:library_manage_app/feature/common/domain/model/user.dart';

import '../../domain/repository/user_repository.dart';

class DriftUserRepositoryImpl implements UserRepository {
  // DriftBookRepositoryImpl._() : this._db = AppDatabase();

  // factory DriftBookRepositoryImpl() => DriftBookRepositoryImpl._();

  // final AppDatabase _db;

  @override
  Future<User> createUser({required User user}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> removeUser({required User user}) {
    // TODO: implement removeUser
    throw UnimplementedError();
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
