import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/mock_database_repository_impl.dart';
import 'package:library_manage_app/library_app/src/presentation/common/loading_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_execute_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/user/user_view_controller.dart';
import 'package:library_manage_app/library_app/src/service/impl/book_service_impl.dart';
import 'package:library_manage_app/library_app/src/service/impl/loan_service_impl.dart';
import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

import '../../data/source/csv_database_repository_impl.dart';
import '../../service/impl/user_service_impl.dart';
import '../../service/interface/loan_service.dart';
import '../book/book_controller.dart';
import '../loan/loan_view_controller.dart';
import '../loan/loan_manage_screen.dart';
import '../user/user_manage_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DatabaseRepository repository = MockDatabaseRepositoryImpl();
  late final BookService bookService = BookServiceImpl(repository: repository);
  late final UserService userService = UserServiceImpl(repository: repository);
  late final LoanService loanService = LoanServiceImpl(repository: repository);
  late final LoanViewController loanController = LoanViewController(
    bookService: bookService,
    userService: userService,
    loanService: loanService,
  );
  late final UserViewController userController = UserViewController(
      userService: userService,
      bookService: bookService,
      loanService: loanService);
  late final BookViewController bookController =
      BookViewController(bookService: bookService);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait(
            [loanController.retrieveBooks(), loanController.retrieveUsers(), userController.retrieveUsers()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LoadingScreen();
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('도서 대출 관리 프로그램')),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('도서관리')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserManageScreen(
                                      userController: userController)));
                        },
                        child: Text('회원관리')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanManageScreen(
                                      loanController: loanController)));
                        },
                        child: Text('대출/반납'))
                  ]),
            ),
          );
        });
  }
}
