import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserManageScreen extends StatelessWidget {
  const UserManageScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(navigationShell.currentIndex == 0 ? '회원 등록' : '회원 검색'),
        ),
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange[900],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.group_add), label: '회원 등록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_remove), label: '회원 검색'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
