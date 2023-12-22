// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/library_app/src/presentation/common/search_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/book_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import 'loan_single_view.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () async {
                    user = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                  controller: widget.loanController,
                                  searchType: SearchType.user,
                                  isBackButtonEnabled: true,
                                )));
                    setState(() {});
                  }, // 회원 검색으로
                  child: Container(
                    child: Center(
                        child: user != null
                            ? UserTile(
                                user: user!,
                                onTap: (_) {
                                  setState(() {
                                    user = null;
                                  });
                                },
                              )
                            : LoanExecuteSearchButton(text:'대상 회원을 선택합니다.')),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () async {
                    book = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                  controller: widget.loanController,
                                  searchType: SearchType.book,
                                  isBackButtonEnabled: true,
                                )));
                    setState(() {});
                  }, // 책 검색으로
                  child: Container(
                    child: Center(
                        child: book != null
                            ? BookTile(
                                book: book!,
                                onTap: (_) {
                                  setState(() {
                                    book = null;
                                  });
                                },
                              )
                            : LoanExecuteSearchButton(text: '대상 도서를 선택합니다.')),
                  )),
            ),
            ElevatedButton(
              
                onPressed: () => user != null && book != null
                    ? widget.loanController
                        .loanRequest(book: book!, user: user!).then((loan) => Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return LoanSingleView(loan: loan,loanViewController: widget.loanController);
                        })))
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(SnackBar(content: Text('대출실행')))

                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('대상 회원과 도서를 선택해주세요.'))),
                child: Text('대출 실행'))
          ],
        ),
      ),
    );
  }
}

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
      height: MediaQuery.of(context).size.height/5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Center(child: Text(text)));
  }
}
