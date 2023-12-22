import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';


class LoanTile extends StatelessWidget {
  const LoanTile({super.key, required this.loan, this.onTap});

  final BookLoan loan;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? ()=> onTap!(loan) :
          () {
            Navigator.pop(context, loan);
          },
      child: ListTile(
        leading: Text(loan.loanUid),
        title: Text(loan.loanDate.toString()),
        subtitle: Text(loan.dueDate.toString()),
      ),
    );
  }
}

