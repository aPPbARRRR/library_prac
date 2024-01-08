import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_manage_app/feature/book/domain/usecase/book_service_impl.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';
import 'package:library_manage_app/feature/book/domain/repository/book_repository.dart';
import 'package:library_manage_app/feature/common/domain/model/book.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';

void main() {
  test('getAllBooks test ok', () async {
    BookServiceImpl testTarget =
        BookServiceImpl(repository: MockBookRepositoryImpl());
    expect(await testTarget.getAllBooks(), Error(Exception()));
  });
}

//  var result = await repository.getAllBooks();
//     return switch (result) {
//       Success<List<Book>, Exception>(:List<Book> result) => Success(result),
//       Error<List<Book>, Exception>(:Exception e) => Error(e),
//       _ => Error(Exception('Unknown Error/ wildcard pattern is matched'))

class MockBookRepositoryImpl implements BookRepository {
  MockBookRepositoryImpl();

  @override
  Future<Result<List<Book>, Exception>> getAllBooks() async {
    // return Success(<Book>[]);
    // return Error(Exception());
    throw Exception(); // 발생 불가. repository getAllBooks에서 Exception 발생시 Error로 return하므로.
  }

  @override
  Future<Result<Book, Exception>> registerBook({required Book book}) {
    // TODO: implement registerBook
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Book>, Exception>> retrieveBooks(
      {required String searchText, required BookSearchType bookSearchType}) {
    // TODO: implement retrieveBooks
    throw UnimplementedError();
  }

  @override
  Future<Result<void, Exception>> unregisterBook({required Book book}) {
    // TODO: implement unregisterBook
    throw UnimplementedError();
  }

  @override
  Future<Result<Book, Exception>> updateBook({required Book book}) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
