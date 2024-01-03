import 'package:flutter/material.dart';

class LoanExecuteSearchButton extends StatelessWidget {
  const LoanExecuteSearchButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Center(child: Text(text)));
  }
}
