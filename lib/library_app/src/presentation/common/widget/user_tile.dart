import 'package:flutter/material.dart';

import '../../../entity/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user, this.onTap});

  final User user;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap != null
            ? () => onTap!(user)
            : () {
                Navigator.pop(context, user);
              },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[700]),
          child: ListTile(
            leading: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  user.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ))),
            title: Text('회원번호 : ${user.userUid}'),
            subtitle: Text('주소 : ${user.address}\n연락처 : ${user.phoneNum}'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
