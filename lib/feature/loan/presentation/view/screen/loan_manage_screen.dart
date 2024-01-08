// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoanManageScreen extends StatelessWidget {
  const LoanManageScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(navigationShell.currentIndex == 0 ? '대출 실행' : '반납 실행'),
        ),
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange[900],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.output), label: '대출'),
            BottomNavigationBarItem(icon: Icon(Icons.input), label: '반납'),
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
