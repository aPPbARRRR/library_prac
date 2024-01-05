import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_button.dart';
import 'package:library_manage_app/feature/user/presentation/view_model/user_single_view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/domain/model/user.dart';

class UserSingleView extends StatelessWidget {
  const UserSingleView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserSingleViewModel>();
    final User user = viewModel.user;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(user.name),
        // ),
        body: DefaultTextStyle(
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[200]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('이름 : ${user.name}'),
                    Text('등록번호 : ${user.userUid}'),
                    Text('연락처 : ${user.phoneNum}'),
                    Text('주소 : ${user.address}'),
                    Text(
                        '생일 : ${DateFormat('yyyy년 M월 d일').format(user.birthDate)}'),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.orange[900]!, width: 3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('대출기록'),
                              ),
                              // Expanded(
                              //   child: ListView(
                              //                 children: loans!
                              //   .where((loan) => loan.userUid == widget.user.userUid)
                              //   .map((userLoan) => LoanTile(
                              //         loan: userLoan,
                              //         users: users,
                              //         books: books,
                              //         onTap: (loan){
                              //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('대출 관련 작업은 메인화면 -> 대출관리 에서 실행해주세요')));
                              //         },
                              //       ))
                              //   .toList(),
                              //               ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                        onTap: () => viewModel.deleteUser(context),
                        text: '회원 삭제')
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
