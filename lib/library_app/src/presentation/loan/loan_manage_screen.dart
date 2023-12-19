import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/common/search_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';

class LoanManageScreen extends StatefulWidget {
  const LoanManageScreen({super.key, required this.loanController});
  final LoanController loanController;

  @override
  State<LoanManageScreen> createState() => _LoanManageScreenState();
}

class _LoanManageScreenState extends State<LoanManageScreen> {
  User? user;
  Book? book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
             GestureDetector(
              onTap: ()async {
                user = await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(loanController: widget.loanController)));
                setState(() {
                  
                });
              }, // 회원 검색으로
              child: Container(
                child: Center(child: Text(user?.name?? '회원을 선택해주세요.'),),
              )),
              GestureDetector(
              onTap: (){}, // 책 검색으로
              child: Container(
                child: Center(child: Text(book?.bookName?? '책을 선택해주세요.'),),
              )),
              ElevatedButton(onPressed: (){
      
              }, child: Text('대출수행'))
            
          
          ],
        ),
      ),
    );
  }
}