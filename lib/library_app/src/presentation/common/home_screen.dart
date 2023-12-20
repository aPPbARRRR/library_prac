import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/presentation/common/loading_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_manage_screen.dart';
import 'package:library_manage_app/library_app/src/service/impl/loan_service_impl.dart';

import '../../data/source/csv_database_repository_impl.dart';
import '../../service/impl/user_service_impl.dart';
import '../loan/loan_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
final DatabaseRepository repository = CSVdatabaseRepositoryImpl();
late final LoanController loanController = LoanController(
      userService: UserServiceImpl(repository: repository),
      loanService: LoanServiceImpl(repository: repository)
      );
      

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loanController.refreshUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LoadingScreen();
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('도서 대출 관리')),
              body: Column(children: [
                ElevatedButton(onPressed: (){}, child: Text('도서관리')),
                ElevatedButton(onPressed: () {}, child: Text('회원관리')),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoanManageScreen(loanController: loanController)));
                }, child: Text('대출/반납'))
              ]),
            ),
          );
        });
  }
}
