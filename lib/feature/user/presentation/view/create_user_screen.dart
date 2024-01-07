import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/feature/user/presentation/view_model/create_user_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widget/custom_text_field_with_label.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController phoneNumTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateUserScreenViewModel>();
    return Form(
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
                      textController: nameTextController, label: '이름'),
                  CustomTextFieldWithLabel(
                    textController: addressTextController,
                    label: '주소',
                  ),
                  CustomTextFieldWithLabel(
                    textController: phoneNumTextController,
                    label: '전화번호(숫자만)',
                    keyboardType: TextInputType.phone,
                    isDigitOnly: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                          onTap: () async =>
                              viewModel.selectBirthDate(context: context),
                          text: '생년월일 입력'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '생년월일 : ${DateFormat('yyyy년 M월 d일').format(viewModel.birthDate)}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      viewModel.createUser(
                          context: context,
                          name: nameTextController.text,
                          address: addressTextController.text,
                          phoneNum: phoneNumTextController.text);
                    }
                  },
                  text: '등록'),
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
