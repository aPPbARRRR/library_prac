import 'package:flutter/material.dart';

import '../../../entity/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user, this.onTap});

  final User user;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? ()=> onTap!(user) :
          () {
            Navigator.pop(context, user);
          },
      child: ListTile(
        leading: Text(user.name),
        title: Text(user.userUid),
        subtitle: Text('${user.address}\n${user.phoneNum}'),
      ),
    );
  }
}

