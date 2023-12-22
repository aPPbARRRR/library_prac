import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime publishDate = DateTime.now();

  // userUid,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime.now())
                          .then((value) => value != null
                              ? publishDate = value
                              : publishDate);
                      setState(() {});
                    },
                    child: Text('출간일 입력')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '출간일 : ${DateFormat('yyyy년 M월 d일').format(publishDate)}'),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await widget.bookViewController
                        .resisterBook(
                            bookName: bookNameTextController.text,
                            publishDate: publishDate)
                        .then((newBook) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookSingleView(
                                book: newBook,
                                controller: widget.bookViewController,
                              )));
                    });
                    widget.bookViewController.retrieveBooks();
                    //등록 완료시 화면 전환 필요
                  }
                },
                child: Text('등록')),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel(
      {super.key,
      required this.nameTextController,
      required this.label,
      this.validator,
      this.keyboardType,
      this.isDigitOnly});

  final TextEditingController nameTextController;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? isDigitOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
        inputFormatters: isDigitOnly != null && isDigitOnly!
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return '값을 입력해주세요.'; // 입력값이 없을 경우 에러 메시지 반환
              }
              return null; // 입력값이 유효할 경우 null 반환
            },
        controller: nameTextController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            label: Text(label),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}