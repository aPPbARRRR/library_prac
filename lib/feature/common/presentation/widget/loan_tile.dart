// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../feature/common/domain/model/book.dart';
import '../../../../../feature/common/domain/model/book_loan.dart';
import '../../../../../feature/common/domain/model/user.dart';

class LoanTile extends StatelessWidget {
  const LoanTile({
    Key? key,
    required this.loan,
    this.onTap,
  }) : super(key: key);

  final BookLoan loan;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    int remainingDays = loan.dueDate.difference(DateTime.now()).inDays;

    return GestureDetector(
      onTap: onTap != null
          ? () => onTap!(loan)
          : () {
              Navigator.pop(context, loan);
            },
      child: Card(
        color: Colors.grey[700],
        child: ListTile(
          leading: Text(loan.isReturned ? '보관중' : '대여중'),
          title: Text('대출번호 : ${loan.loanUid}'),
          subtitle: Text(
              '${DateFormat('yy년 M월 d일 대출 실행').format(loan.loanDate)}\n${loan.loanUid}'),
          trailing: loan.isReturned
              ? Text(
                  '반납완료',
                  style: TextStyle(color: Colors.black),
                )
              : Text(
                  '대출 잔여일 : ${remainingDays}일',
                ),
        ),
      ),
    );
  }
}
