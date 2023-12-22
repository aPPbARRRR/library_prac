import 'package:flutter/material.dart';

import '../../entity/book.dart';
import 'book_view_controller.dart';

class BookSingleView extends StatefulWidget {
  const BookSingleView({super.key, required this.book, required this.controller});

final Book book;
final BookViewController controller;

  @override
  State<BookSingleView> createState() => _BookSingleViewState();
}

class _BookSingleViewState extends State<BookSingleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.bookName),),
      body: Center(
        child: Column(children: [
          Text('도서 싱글 뷰. 도서 정보, 도서 삭제, 도서 정보 수정 등 제공'),
          ElevatedButton(onPressed: ()async {
            // await widget.controller.removeUser(widget.user);        
              Navigator.pop(context);
          }, child: Text('도서 삭제'))
        ]),
      ),
    );
  }
}