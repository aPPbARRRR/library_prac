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
      // appBar: AppBar(title: Text(widget.user.name),),
      body: Center(
        child: Column(children: [
          Text('유저 싱글 뷰. 유저 정보, 유저 삭제, 유저 정보 수정 등 제공'),
          ElevatedButton(onPressed: ()async {
            // await widget.controller.removeUser(widget.user);        
              Navigator.pop(context);
          }, child: Text('회원 삭제'))
        ]),
      ),
    );
  }
}