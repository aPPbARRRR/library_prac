import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/library_app/src/presentation/user/user_controller.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({super.key, required this.userController});
  final UserController userController;

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController phoneNumTextController = TextEditingController();

  DateTime birthDate = DateTime.now();

  // userUid,
  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        OutlinedButton(
            onPressed: () async {
              await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime.now())
                  .then(
                      (value) => value != null ? birthDate = value : birthDate);
              setState(() {});
            },
            child: Text('생년월일 입력')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('생년월일 : ${DateFormat('yyyy년 M월 d일').format(birthDate)}'),
        ),
        Spacer(),
        ElevatedButton(
            onPressed: () {
              print('등록 수행 서비스에 요청해야함');
              widget.userController.createUser(
                  name: nameTextController.text,
                  address: addressTextController.text,
                  phoneNum: int.parse(phoneNumTextController.text),
                  birthDate: birthDate);
            },
            child: Text('등록')),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel(
      {super.key,
      required this.nameTextController,
      required this.label,
      this.keyboardType});

  final TextEditingController nameTextController;
  final String label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextFormField(
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
