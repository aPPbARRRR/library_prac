// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/drift_db_repository_impl.dart';
import 'package:library_manage_app/library_app/src/presentation/book/book_manage_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/loading_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/user/user_view_controller.dart';
import 'package:library_manage_app/library_app/src/service/impl/book_service_impl.dart';
import 'package:library_manage_app/library_app/src/service/impl/loan_service_impl.dart';
import 'package:library_manage_app/library_app/src/service/interface/book_service.dart';
import 'package:library_manage_app/library_app/src/service/interface/user_service.dart';

import '../../service/impl/user_service_impl.dart';
import '../../service/interface/loan_service.dart';
import '../book/book_view_controller.dart';
import '../loan/loan_manage_screen.dart';
import '../loan/loan_view_controller.dart';
import '../user/user_manage_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // final DatabaseRepository repository = MockDatabaseRepositoryImpl();
  final DatabaseRepository repository = DriftDBRepositoryImpl();
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
  late final BookViewController bookController = BookViewController(
      userService: userService,
      bookService: bookService,
      loanService: loanService);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: Future.wait([
            bookController.refreshAllDataFromDB(),
            loanController.refreshAllDataFromDB(),
            userController.refreshAllDataFromDB()
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return LoadingScreen();
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    bottom: AppBar(title: Text('afdas')),
                    automaticallyImplyLeading: false,
                    pinned: true,
                    backgroundColor: Colors.black,
                    flexibleSpace: FlexibleSpaceBar(
                      
                      centerTitle: true,
                      title: Text('도서 대출 관리 프로그램',),
                      background: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          '/Users/anjongjun/FlutterProjects/orm/library_prac/asset/images/app_bar_back_image.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 800,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTappableButton(
                                  onTap: () async {
                                    await loanController.retrieveUsers();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoanManageScreen(
                                                    loanController:
                                                        loanController)));
                                  },
                                  text: '대출관리',
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomTappableButton(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserManageScreen(
                                                          userController:
                                                              userController)));
                                        },
                                        text: '회원관리',
                                      ),
                                      CustomTappableButton(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookManageScreen(
                                                          bookViewController:
                                                              bookController)));
                                        },
                                        text: '도서관리',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Center(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown[100],
                            ),
                          ),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CustomTappableButton extends StatelessWidget {
  const CustomTappableButton({
    Key? key,
    required this.text,
    this.imgUrl,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String? imgUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imgUrl != null) Image.asset(imgUrl!),
                Expanded(child: Center(child: Text(text)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
