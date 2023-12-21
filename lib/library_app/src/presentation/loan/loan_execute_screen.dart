import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/common/search_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/book_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';

class LoanExecuteScreen extends StatefulWidget {
  const LoanExecuteScreen({super.key, required this.loanController});
  final LoanViewController loanController;

  @override
  State<LoanExecuteScreen> createState() => _LoanExecuteScreenState();
}

class _LoanExecuteScreenState extends State<LoanExecuteScreen> {
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
                onTap: () async {
                  user = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(
                                controller: widget.loanController,
                                searchType: SearchType.user,
                              )));
                  setState(() {});
                }, // 회원 검색으로
                child: Container(
                  child: Center(
                      child: user != null
                          ? UserTile(user: user!, onTap: (){setState(() {
                            user = null;
                          });},)
                          : Text('대상 회원을 선택합니다.')),
                )),
            GestureDetector(
                onTap: () async {
                  book = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(
                                controller: widget.loanController,
                                searchType: SearchType.book,
                              )));
                  setState(() {});
                }, // 책 검색으로
                child: Container(
                  child: Center(
                      child: book != null
                          ? BookTile(book: book!, onTap: (){setState(() {
                            book = null;
                          });},)
                          : Text('대상 도서를 선택합니다.')),
                )),
            ElevatedButton(
                onPressed: () => user != null && book != null
                    ?  ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('대출실행'))) :ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('대상 회원과 도서를 선택해주세요.')))
                    ,
                child: Text('대출수행'))
          ],
        ),
      ),
    );
  }
}
