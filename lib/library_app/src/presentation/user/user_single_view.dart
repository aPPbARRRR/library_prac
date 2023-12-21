import 'package:flutter/material.dart';

import '../../entity/user.dart';

class UserSingleView extends StatelessWidget {
  const UserSingleView({super.key, required this.user});

final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name),),
      body: Center(
        child: Column(children: [
          Text('유저 싱글 뷰. 유저 정보, 유저 삭제, 유저 정보 수정 등 제공')
        ]),
      ),
    );
  }
}