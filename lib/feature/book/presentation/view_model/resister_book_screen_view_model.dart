// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/feature/book/domain/usecase/book_service.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/domain/model/result.dart';
import '../../../common/domain/model/book.dart';

class ResisterBookScreenViewModel extends ChangeNotifier {
  ResisterBookScreenViewModel({
    required this.bookService,
  });

  final BookService bookService;
  DateTime date = DateTime.now();

  Future<void> resisterBook(
      {required String bookName,
      required String author,
      required DateTime publishDate,
      required BuildContext context}) async {
    print(1);
    var result = await bookService.resisterBook(
        book: Book(
            bookName: bookName,
            bookUid: const Uuid().v4(),
            author: author,
            publishDate: publishDate,
            isBookLoaned: false));
    print(-1);
    print(result.toString());
    if (result is Success<Book, Exception>) {
      print(-2);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('도서 등록 성공')));
    } else if (result is Error<Book, Exception>) {
      print(-2);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result.toString())));
    }
  }

  void selectDate(context) async {
    await showDatePicker(
            context: context,
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now())
        .then((value) => value != null ? date = value : date);
    notifyListeners();
  }
}
