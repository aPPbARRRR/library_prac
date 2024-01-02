import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/date_picker_row_view_model.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../library_app/src/presentation/common/widget/custom_button.dart';

class DatePickerRow extends StatelessWidget {
  const DatePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResisterBookScreenViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
            onTap: () async {
              viewModel.selectDate(context);
            },
            text: '출간일 입력'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text('출간일 : ${DateFormat('yyyy년 M월 d일').format(viewModel.date)}'),
        ),
      ],
    );
  }
}
