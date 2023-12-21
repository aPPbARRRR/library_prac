import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/library_app/src/presentation/user/user_view_controller.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import 'user_single_view.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({super.key, required this.userController});
  final UserViewController userController;

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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFieldWithLabel(
                nameTextController: nameTextController, label: '이름'),
            CustomTextFieldWithLabel(
              nameTextController: addressTextController,
              label: '주소',
            ),
            CustomTextFieldWithLabel(
              nameTextController: phoneNumTextController,
              label: '전화번호(숫자만)',
              keyboardType: TextInputType.phone,
              isDigitOnly: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime.now())
                          .then((value) =>
                              value != null ? birthDate = value : birthDate);
                      setState(() {});
                    },
                    child: Text('생년월일 입력')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '생년월일 : ${DateFormat('yyyy년 M월 d일').format(birthDate)}'),
                ),
              ],
            ),

            // Spacer(),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await widget.userController
                        .createUser(
                            name: nameTextController.text,
                            address: addressTextController.text,
                            phoneNum: int.parse(phoneNumTextController.text),
                            birthDate: birthDate)
                        .then((newUser) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => UserSingleView(
                                user: newUser,
                                controller: widget.userController,
                              )));
                    });
                    widget.userController.retrieveUsers();
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
