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
    required this.users,
    required this.books,
  }) : super(key: key);

  final BookLoan loan;
  final Function? onTap;
  final List<User>? users;
  final List<Book>? books;

  @override
  Widget build(BuildContext context) {
    User user = users!.where((user) => user.userUid == loan.userUid).first;
    Book book = books!.where((book) => book.bookUid == loan.bookUid).first;
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
          leading: Text(user.name),
          title: Text(book.bookName),
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
