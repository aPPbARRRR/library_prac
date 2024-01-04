// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';

import '../../../../common/domain/model/book_loan.dart';

class LoanSingleView extends StatelessWidget {
  const LoanSingleView({
    Key? key,
    required this.loan,
  }) : super(key: key);

  final BookLoan loan;

  @override
  Widget build(BuildContext context) {
    // User user = controller.users!
    //     .where((user) => user.userUid == loan.userUid)
    //     .first; // ! 사용 주의
    // Book book = controller.books!
    //     .where((book) => book.bookUid == loan.bookUid)
    //     .first; // ! 사용 주의
    // int day = 7;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('대출 상세'),
          actions: [
            CustomButton(
              onTap: () async {
                // await controller.returnLoan(loan: loan, context: context).then(
                //     (value) =>
                //         value != null ? Navigator.of(context).pop() : null);
              },
              text: '반납처리',
              fontSize: 17,
              padding: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text('대출자 : ${user.name}, (${user.userUid})',
              //     overflow: TextOverflow.ellipsis),
              // Text(
              //   '대출도서 : ${book.bookName}, (${book.bookUid})',
              //   overflow: TextOverflow.ellipsis,
              // ),
              // Text(
              //     '대출 실행일 : ${DateFormat('yyyy년 M월 d일').format(loan.loanDate)}'),
              // Text(
              //     '반납 예정일 : ${DateFormat('yyyy년 M월 d일').format(loan.dueDate)}'),
              // Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text('연장일 :'),
              //     DropdownButton(
              //         value: day,
              //         items: List.generate(7, (index) => index + 1)
              //             .map((e) => DropdownMenuItem(
              //                   child: Text(e.toString()),
              //                   value: e,
              //                 ))
              //             .toList(),
              //         onChanged: (value) {
              //           if (value != null) day = value;
              //           print(day);
              //         }),
              //     CustomButton(
              //         onTap: () async {
              //           await controller.extendLoan(
              //               loan: loan, day: day, context: context);
              //           Navigator.pop(context);
              //         },
              //         text: '대출 연장'),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
