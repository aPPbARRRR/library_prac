// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/feature/loan/presentation/view_model/loan_execute_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../../common/presentation/widget/book_tile.dart';
import '../../../../common/presentation/widget/user_tile.dart';
import '../widget/loan_execute_search_button.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async =>
                            await viewModel.goToUserSearchScreen(context),
                        child: Center(
                            child: viewModel.user != null
                                ? UserTile(
                                    user: viewModel.user!,
                                    onTap: (_) =>
                                        viewModel.onSelectedUserTileTapped(),
                                  )
                                : const LoanExecuteSearchButton(
                                    text: '대상 회원을 선택합니다.')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async =>
                            await viewModel.goToBookSearchScreen(context),
                        child: Center(
                            child: viewModel.book != null
                                ? BookTile(
                                    book: viewModel.book!,
                                    onTap: (_) =>
                                        viewModel.onSelectedBookTileTapped(),
                                  )
                                : const LoanExecuteSearchButton(
                                    text: '대상 도서를 선택합니다.')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                    onTap: () => viewModel.executeLoan(context), text: '대출 실행'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
