import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/feature/user/presentation/view_model/create_user_screen_view_model.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/custom_button.dart';
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

  DateTime birthDate = DateTime.now();

  // userUid,
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateUserScreenViewModel>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
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
                    onTap: () async {
                      await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime.now())
                          .then((value) =>
                              value != null ? birthDate = value : birthDate);
                      setState(() {});
                    },
                    text: '생년월일 입력'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '생년월일 : ${DateFormat('yyyy년 M월 d일').format(birthDate)}'),
                ),
              ],
            ),

            // Spacer(),
            CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    // await widget.userController
                    //     .createUser(
                    //         name: nameTextController.text,
                    //         address: addressTextController.text,
                    //         phoneNum: int.parse(phoneNumTextController.text),
                    //         birthDate: birthDate)
                    //     .then((newUser) {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (context) => UserSingleView(
                    //             user: newUser,
                    //             controller: widget.userController,
                    //           )));
                    // });
                    // widget.userController.retrieveUsers();
                    // //등록 완료시 화면 전환 필요
                  }
                },
                text: '등록'),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
