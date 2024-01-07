import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
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
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('저자 : ${book.author}'),
                  Text('등록번호 : ${book.bookUid}'),
                  Text('출판일 : ${book.publishDate}'),
                ],
              ),
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                  onTap: () async =>
                      await viewModel.deleteBook(context: context),
                  text: '도서 삭제'),
            ],
          )
        ]),
      ),
    );
  }
}
