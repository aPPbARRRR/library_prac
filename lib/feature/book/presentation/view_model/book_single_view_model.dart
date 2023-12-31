// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/domain/usecase/book_service_impl.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:provider/provider.dart';

import '../../../common/domain/model/book.dart';

class BookSingViewModel extends ChangeNotifier {
  BookSingViewModel({required Book book}) : _book = book;

  final Book _book;
  Book? get book => _book;

  Future<void> deleteBook({required BuildContext context}) async {
    var result = await context
        .read<BookServiceProvider>()
        .bookService
        .deleteBook(book: _book);
    if (context.mounted) {
      switch (result) {
        case Success<void, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('등록 도서가 삭제되었습니다.')));
          context.pop();
        case Error<void, Exception>():
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('등록 도서 삭제에 실패하였습니다. ${result.e}')));
      }
    }
  }
}
