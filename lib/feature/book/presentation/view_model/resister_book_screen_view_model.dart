// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';

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
    var result = await bookService.resisterBook(
        book: Book(
            bookName: bookName,
            bookUid: const Uuid().v4(),
            author: author,
            publishDate: publishDate,
            isBookLoaned: false));
    if (context.mounted) {
      switch (result) {
        case Success<Book, Exception>():
          context.goNamed(AppRoutes.bookSingle, extra: result.result as Book);
        case Error<Book, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.toString())));
      }
    }
  }

  void selectDate(context) async {
    await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: Colors.orange[300]!, // <-- SEE HERE
                    onPrimary: Colors.orange[900]!, // <-- SEE HERE
                    onSurface: Colors.orange, // <-- SEE HERE
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now())
        .then((value) => value != null ? date = value : date);
    notifyListeners();
  }
}
