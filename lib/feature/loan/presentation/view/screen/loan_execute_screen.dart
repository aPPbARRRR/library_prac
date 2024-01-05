// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';

import 'package:library_manage_app/feature/loan/presentation/view_model/loan_execute_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../../common/presentation/widget/book_tile.dart';
import '../../../../common/presentation/widget/user_tile.dart';
import '../widget/loan_execute_search_button.dart';
import 'loan_search_screen.dart';

class LoanExecuteScreen extends StatefulWidget {
  const LoanExecuteScreen({super.key});

  @override
  State<LoanExecuteScreen> createState() => _LoanExecuteScreenState();
}

class _LoanExecuteScreenState extends State<LoanExecuteScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoanExecuteScreenViewModel>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async =>
                        context.pushNamed(AppRoutes.loanUserSearch), // 회원 검색으로
                    child: Container(
                      child: Center(
                          child: viewModel.user != null
                              ? UserTile(
                                  user: viewModel.user!,
                                  onTap: (_) {
                                    setState(() {
                                      viewModel.user = null;
                                    });
                                  },
                                )
                              : LoanExecuteSearchButton(text: '대상 회원을 선택합니다.')),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async =>
                        context.pushNamed(AppRoutes.loanBookSearch), // 책 검색으로
                    child: Container(
                      child: Center(
                          child: viewModel.book != null
                              ? BookTile(
                                  book: viewModel.book!,
                                  onTap: (_) {
                                    setState(() {
                                      viewModel.book = null;
                                    });
                                  },
                                )
                              : LoanExecuteSearchButton(text: '대상 도서를 선택합니다.')),
                    )),
              ),
              CustomButton(
                  onTap: () {
                    // if (viewModel.book != null && viewModel.book != null && !viewModel.book!.isBookLoaned) {
                    //   widget.loanController
                    //       .loanRequest(book: viewModel.book!, user: viewModel.user!)
                    //       .then((loan) => Navigator.of(context)
                    //               .push(MaterialPageRoute(builder: (context) {
                    //             return LoanSingleView(
                    //                 loan: viewModel.loan,
                    //                 loanViewController: widget.loanController);
                    //           })));
                    // } else if (viewModel.book != null && viewModel.book!.isBookLoaned) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('이미 대출중인 도서입니다.')));
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('대상 회원과 도서를 선택해주세요.')));
                    // }
                  },
                  text: '대출 실행')
            ],
          ),
        ),
      ),
    );
  }
}
