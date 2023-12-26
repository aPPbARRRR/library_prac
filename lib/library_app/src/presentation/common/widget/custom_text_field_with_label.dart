import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange,width: 3),
                borderRadius: BorderRadius.circular(10)) ,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
