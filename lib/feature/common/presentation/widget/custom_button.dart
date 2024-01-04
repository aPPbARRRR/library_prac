// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double? fontSize;
  final double? padding;
  const CustomButton(
      {Key? key, required this.onTap, required this.text, this.fontSize, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding??0),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.orange[900],
            foregroundColor: Colors.black,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize ?? 20)),
      ),
    );
  }
}
