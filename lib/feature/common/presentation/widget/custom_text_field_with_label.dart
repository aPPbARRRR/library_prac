import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel(
      {super.key,
      required this.textController,
      this.hintText,
      this.label,
      this.validator,
      this.keyboardType,
      this.isDigitOnly,
      this.icon,
      this.onPressed});

  final TextEditingController textController;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? isDigitOnly;
  final String? hintText;
  final Function()? onPressed;
  final Icon? icon;

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
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: icon != null
                ? IconButton(onPressed: onPressed, icon: icon!)
                : null,
            hintText: hintText ?? null,
            label: label != null ? Text(label!) : null,
            labelStyle: TextStyle(color: Colors.orange),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 3),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
