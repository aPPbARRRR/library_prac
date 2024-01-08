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
    } catch (e) {
      return Result.error(Exception(e));
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
      await (db.delete(db.bookTable)
            ..where((tbl) => tbl.bookUid.equals(book.bookUid)))
          .go();
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
}
