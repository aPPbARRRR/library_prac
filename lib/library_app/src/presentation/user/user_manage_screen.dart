import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/user/create_user_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/user/remove_user_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/user/user_controller.dart';

class UserManageScreen extends StatefulWidget {
  const UserManageScreen({super.key, required this.userController});
  final UserController userController;

  @override
  State<UserManageScreen> createState() => _UserManageScreenState();
}

class _UserManageScreenState extends State<UserManageScreen> {

  int currentPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(currentPageIndex == 0 ? '회원 등록' : '회원 삭제'),),
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
            icon: Icon(Icons.group_add),
            label: '회원 등록',
          ),
          NavigationDestination(
            icon: Icon(Icons.group_remove),
            label: '회원 삭제',
          ),
         
        ],
      ),
       body:[CreateUserScreen(userController: widget.userController,), RemoveUserScreen()
       ][currentPageIndex],

      ),
     
    );;
  }
}