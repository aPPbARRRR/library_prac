import 'package:flutter/material.dart';

import '../../view_model/loan_search_screen_view_model.dart';

class LoanSearchScreenDrawer extends StatelessWidget {
  const LoanSearchScreenDrawer({
    super.key,
    required this.viewModel,
  });

  final LoanSearchScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('정렬방식',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              viewModel.toggleIsAscendingSorted();
            },
            child: Text(
              '오름차순',
              style: viewModel.isAscendingSorted
                  ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  : null,
            )),
        TextButton(
            onPressed: () {
              viewModel.toggleIsAscendingSorted();
            },
            child: Text(
              '내림차순',
              style: !viewModel.isAscendingSorted
                  ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  : null,
            )),
        Divider(),
        Text('정렬기준',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              viewModel.toggleIsExpirationDateBasedSort();
            },
            child: Text(
              '대출 실행일 기준',
              style: !viewModel.isExpirationDateBasedSort
                  ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  : null,
            )),
        TextButton(
            onPressed: () {
              viewModel.toggleIsExpirationDateBasedSort();
            },
            child: Text(
              '대출 잔여일 기준',
              style: viewModel.isExpirationDateBasedSort
                  ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  : null,
            )),
      ]),
    );
  }
}
