import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/custom_button.dart';

import '../common/widget/custom_text_field_with_label.dart';
import 'book_view_controller.dart';
import 'book_single_view.dart';

class ResisterBookScreen extends StatefulWidget {
  ResisterBookScreen({super.key, required this.bookViewController});
  final BookViewController bookViewController;

  @override
  State<ResisterBookScreen> createState() => _ResisterBookScreenState();
}

class _ResisterBookScreenState extends State<ResisterBookScreen> {
  final TextEditingController bookNameTextController = TextEditingController();
  final TextEditingController authorTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime publishDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFieldWithLabel(
                nameTextController: bookNameTextController, label: '도서명'),
            CustomTextFieldWithLabel(
                nameTextController: authorTextController, label: '저자'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(onTap: () async {
                      await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime.now())
                          .then((value) => value != null
                              ? publishDate = value
                              : publishDate);
                      setState(() {});
                    }, text: '출간일 입력'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '출간일 : ${DateFormat('yyyy년 M월 d일').format(publishDate)}'),
                ),
              ],
            ),
            SizedBox(
              height: 45,
              child: CustomButton(onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.bookViewController
                          .resisterBook(
                              bookName: bookNameTextController.text,
                              author: authorTextController.text,
                              publishDate: publishDate)
                          .then((newBook) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookSingleView(
                                  book: newBook,
                                  controller: widget.bookViewController,
                                )));
                      });
                      widget.bookViewController.retrieveBooks();
                    }
                  }, text: '등록'),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
