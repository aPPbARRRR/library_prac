import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/book/presentation/view/widget/date_picker_row.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_single_view_model.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/date_picker_row_view_model.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../../library_app/src/presentation/common/widget/custom_text_field_with_label.dart';

class ResisterBookScreen extends StatelessWidget {
  ResisterBookScreen({super.key});

  final TextEditingController bookNameTextController = TextEditingController();
  final TextEditingController authorTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResisterBookScreenViewModel>();
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
            DatePickerRow(),
            SizedBox(
              height: 45,
              child: CustomButton(
                  onTap: () async {
                    viewModel.resisterBook(
                        bookName: bookNameTextController.text,
                        author: authorTextController.text,
                        publishDate: viewModel.date,
                        context: context);
                  },
                  text: '등록'),
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
