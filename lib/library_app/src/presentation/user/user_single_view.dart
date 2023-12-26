import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/loan_tile.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import 'user_view_controller.dart';

class UserSingleView extends StatefulWidget {
  const UserSingleView(
      {super.key, required this.user, required this.controller});

  final User user;
  final UserViewController controller;

  @override
  State<UserSingleView> createState() => _UserSingleViewState();
}

class _UserSingleViewState extends State<UserSingleView> {
  @override
  Widget build(BuildContext context) {
    final List<BookLoan>? loans = widget.controller.loans;
    final List<User>? users = widget.controller.users;
    final List<Book>? books = widget.controller.books;
    final User user = widget.user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[200]),
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
                Text('생일 : ${DateFormat('yyyy년 M월 d일').format(user.birthDate)}'),
               
                
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange[900]!,width: 3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('대출기록'),
                          ),
                          Expanded(
                            child: ListView(
                                          children: loans!
                            .where((loan) => loan.userUid == widget.user.userUid)
                            .map((userLoan) => LoanTile(
                                  loan: userLoan,
                                  users: users,
                                  books: books,
                                  onTap: (loan){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('대출 관련 작업은 메인화면 -> 대출관리 에서 실행해주세요')));
                                  },
                                ))
                            .toList(),
                                        ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
               
               
                ElevatedButton(
                    onPressed: () async {
                      await widget.controller.removeUser(widget.user);
                      Navigator.pop(context);
                    },
                    child: Text('회원 삭제'))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
