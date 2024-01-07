// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:library_manage_app/feature/loan/presentation/view_model/loan_single_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../common/domain/model/book.dart';
import '../../../../common/domain/model/book_loan.dart';
import '../../../../common/domain/model/user.dart';

class LoanSingleView extends StatelessWidget {
  const LoanSingleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoanSingleViewModel>();

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: viewModel.onBuild(context),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.done &&
                    viewModel.book != null &&
                    viewModel.user != null) {
                  User user = viewModel.user!;
                  Book book = viewModel.book!;
                  BookLoan loan = viewModel.loan;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('대출자 : ${user.name}, (${user.userUid})',
                            overflow: TextOverflow.ellipsis),
                        Text(
                          '대출도서 : ${book.bookName}, (${book.bookUid})',
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                            '대출 실행일 : ${DateFormat('yyyy년 M월 d일').format(loan.loanDate)}'),
                        Text(
                            '반납 예정일 : ${DateFormat('yyyy년 M월 d일').format(loan.dueDate)}'),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('연장일 :'),
                            DropdownButton(
                                value: viewModel.loanExtendDays,
                                items: viewModel.availableExtendDays
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toString()),
                                        ))
                                    .toList(),
                                onChanged: (value) =>
                                    viewModel.selectExtendDays(value!)),
                            CustomButton(
                                onTap: () async => await viewModel.extendsLoan(
                                    context: context),
                                text: '대출 연장'),
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Dialog(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                          child: Image.asset(
                        'asset/images/logo_color_2.png',
                      )),
                      LinearProgressIndicator(
                        color: Colors.orange[700],
                      )
                    ],
                  )),
                );
              })),
    );
  }
}
