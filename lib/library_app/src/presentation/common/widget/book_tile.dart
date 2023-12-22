import 'package:flutter/material.dart';

import '../../../entity/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book, this.onTap});

  final Book book;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap != null
            ? () => onTap!(book)
            : () {
                Navigator.pop(context, book);
              },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[700],
          ),
          child: ListTile(
            leading: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  book.isBookLoaned ? '대출중' : '보관중',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ))),
            title: Text('${book.bookName}'),
            subtitle: Text('출간일 : ${book.publishDate}\n등록번호 : ${book.bookUid}'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
