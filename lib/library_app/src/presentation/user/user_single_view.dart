import 'package:flutter/material.dart';

import '../../entity/user.dart';
import 'user_view_controller.dart';

class UserSingleView extends StatelessWidget {
  const UserSingleView({super.key, required this.user, required this.controller});

final User user;
final UserViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name),),
      body: Center(
        child: Column(children: [
          Text('유저 싱글 뷰. 유저 정보, 유저 삭제, 유저 정보 수정 등 제공'),
          ElevatedButton(onPressed: ()async {
            await controller.removeUser(user);
            Navigator.pop(context);
          }, child: Text('회원 삭제'))
        ]),
      ),
    );
  }
}