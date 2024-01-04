import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/presentation/view/widget/date_picker_row.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../common/presentation/widget/custom_text_field_with_label.dart';

class ResisterBookScreen extends StatelessWidget {
  ResisterBookScreen({super.key});

  final TextEditingController bookNameTextController = TextEditingController();
  final TextEditingController authorTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResisterBookScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('도서 등록'),
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFieldWithLabel(
                        textController: bookNameTextController, label: '도서명'),
                    CustomTextFieldWithLabel(
                        textController: authorTextController, label: '저자'),
                    const DatePickerRow(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  onTap: () async {
                    await viewModel.resisterBook(
                        bookName: bookNameTextController.text,
                        author: authorTextController.text,
                        publishDate: viewModel.date,
                        context: context);
                  },
                  text: '등록'),
            ),
          ],
        ),
      ),
    );
  }
}
