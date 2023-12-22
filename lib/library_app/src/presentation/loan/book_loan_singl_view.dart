// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';

import '../../entity/book_loan.dart';

class BookLoanSingleView extends StatelessWidget {
  const BookLoanSingleView({
    Key? key,
    required this.loanViewController,
    required this.loan,
  }) : super(key: key);

final LoanViewController loanViewController;

  final BookLoan loan;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('대출 상세'),),
      // body: FutureBuilder(future: loanViewController.getLoanDetailInfo, builder: (context, snapshot){
      //   retrun Column();
      // }),
    );
  }
}
