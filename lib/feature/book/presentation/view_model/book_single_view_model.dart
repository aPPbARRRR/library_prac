import 'package:flutter/material.dart';

import '../../../common/domain/model/book.dart';

class BookSingViewModel extends ChangeNotifier {
  Book? _book;

  Book? get book => _book;

  void setBook(Book book) => _book = book;
}
