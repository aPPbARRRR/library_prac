// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_execute_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_return_screen.dart';

import 'loan_controller.dart';

class LoanManageScreen extends StatefulWidget {
  const LoanManageScreen({
    Key? key,
    required this.loanController,
  }) : super(key: key);
  final LoanController loanController;

  @override
  State<LoanManageScreen> createState() => _LoanManageScreenState();
}

class _LoanManageScreenState extends State<LoanManageScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(currentPageIndex == 0 ? '대출 실행' : '반납 실행'),),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.output),
            label: '대출',
          ),
          NavigationDestination(
            icon: Icon(Icons.input),
            label: '반납',
          ),
         
        ],
      ),
       body:[LoanExecuteScreen(loanController: widget.loanController),
       LoanReturnScreen()
       ][currentPageIndex],

      ),
     
    );
  }
}
