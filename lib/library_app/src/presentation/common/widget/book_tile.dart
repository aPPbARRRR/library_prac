import 'package:flutter/material.dart';

import '../../../entity/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book, this.onTap});

  final Book book;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pop(context, book);
          },
      child: ListTile(
        leading: Text(book.bookName),
        title: Text(book.isBookLoaned ? '대출중' : '서고 보관중'),
        subtitle: Text('${book.publishDate}'),
      ),
    );
  }
}
