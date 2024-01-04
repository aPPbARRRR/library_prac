// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/feature/book/data/data_source/drift_book_repository_impl.dart';
import 'package:library_manage_app/feature/book/domain/repository/book_repository.dart';
import 'package:library_manage_app/feature/common/domain/model/book.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';

import '../../../../shared/drift/repository/drift_database.dart';
import '../../domain/model/book_search_type.dart';
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

  @override
  Future<Result<List<Book>, Exception>> getAllBooks() async {
    var result = await repository.getAllBooks();
    return switch (result) {
      Success<List<Book>, Exception>(:List<Book> result) => Success(result),
      Error<List<Book>, Exception>(:Exception e) => Error(e),
      _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))
    };
  }

  @override
  Future<Result<void, Exception>> deleteBook({required Book book}) async {
    var result = await repository.unregisterBook(book: book);
    return switch (result) {
      Success<List<Book>, Exception>(:List<Book> result) => Success(null),
      Error<List<Book>, Exception>(:Exception e) => Error(e),
      _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))
    };
  }

  @override
  Future<Result<Book, Exception>> resisterBook({required Book book}) async {
    var result = await repository.registerBook(book: book);
    return switch (result) {
      Success<Book, Exception>(:Book result) => Success(result),
      Error<Book, Exception>(:Exception e) => Error(e),
      _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))
    };
  }

  @override
  Future<Result<List<Book>, Exception>> retrieveBooks(
      {required String searchText,
      required BookSearchType bookSearchType}) async {
    var result = await repository.retrieveBooks(
        searchText: searchText, bookSearchType: bookSearchType);
    return switch (result) {
      Success<List<Book>, Exception>(:List<Book> result) => Success(result),
      Error<List<Book>, Exception>(:Exception e) => Error(e),
      _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))
    };
  }

  @override
  Future<Result<Book, Exception>> updateBook({required Book book}) async {
    var result = await repository.updateBook(book: book);
    return switch (result) {
      Success<Book, Exception>(:Book result) => Success(result),
      Error<Book, Exception>(:Exception e) => Error(e),
      _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))
    };
  }
}
