// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/feature/book/data/data_source/drift_book_repository_impl.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';
import 'package:library_manage_app/feature/book/domain/repository/book_repository.dart';

import '../../../../shared/data/drift/drift_database.dart';
import '../../../common/domain/model/book.dart';
import '../../domain/usecase/book_service.dart';

class BookServiceProvider extends ChangeNotifier {
  BookServiceProvider({
    required this.db,
  }) : bookService =
            BookServiceImpl(repository: DriftBookRepositoryImpl(db: db));

  final AppDatabase db;
  final BookService bookService;
}

class BookServiceImpl implements BookService {
  BookServiceImpl({required this.repository});

  final BookRepository repository;

  // 리스트<북> 을 반환하는 함수의 경우, 검색결과 없는 경우를 고려해서 반영해야함.

  @override
  Future<void> deleteBook({required Book book}) async {
    try {
      await repository.unregisterBook(book: book);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Book>> getAllBooks() async {
    try {
      return await repository.getAllBooks();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Book> resisterBook({required Book book}) async {
    try {
      return await repository.registerBook(book: book);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Book>> retrieveBooksFromAuthor({required String author}) async {
    try {
      return await repository.retrieveBooks(
          searchText: author, bookSearchType: BookSearchType.author);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Book>> retrieveBooksFromName({required String bookName}) async {
    try {
      return await repository.retrieveBooks(
          searchText: bookName, bookSearchType: BookSearchType.name);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Book> retrieveBooksFromUid({required String uid}) async {
    try {
      List<Book> bookList = await repository.retrieveBooks(
          searchText: uid, bookSearchType: BookSearchType.uid);
      return bookList[0];
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Book> updateBook({required Book book}) async {
    try {
      return await repository.updateBook(book: book);
    } catch (e) {
      throw Exception(e);
    }
  }
}
