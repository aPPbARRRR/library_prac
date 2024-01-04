import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../common/domain/model/book.dart';
import '../../view_model/book_single_view_model.dart';

class BookSingleView extends StatelessWidget {
  const BookSingleView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookSingViewModel>();
    final Book book = viewModel.book!;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName),
      ),
      body: Center(
        child: Column(children: [
          Text('도서 싱글 뷰. 도서 정보, 도서 삭제, 도서 정보 수정 등 제공'),
          ElevatedButton(
              onPressed: () async =>
                  await viewModel.deleteBook(context: context),
              child: Text('도서 삭제'))
        ]),
      ),
    );
  }
}
