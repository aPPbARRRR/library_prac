// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/drift_db_repository_impl.dart';
import 'package:library_manage_app/library_app/src/presentation/book/book_manage_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/loading_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/custom_button.dart';
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
    return FutureBuilder(
        future: Future.wait([
          Future.delayed(Duration(milliseconds: 2000)),
          bookController.refreshAllDataFromDB(),
          loanController.refreshAllDataFromDB(),
          userController.refreshAllDataFromDB()
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LoadingScreen();
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text('도서 대출 관리'),),
                body: AppTaskButtonSection(
              bookController: bookController,
              loanController: loanController,
              userController: userController,
            )),
          );
        });
  }
}

class AppTaskButtonSection extends StatelessWidget {
  const AppTaskButtonSection({
    super.key,
    required this.loanController,
    required this.userController,
    required this.bookController,
  });

  final LoanViewController loanController;
  final UserViewController userController;
  final BookViewController bookController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView(
      scrollDirection: height > width ? Axis.vertical : Axis.horizontal,
      children: [
        HomeScreenButton(
          padding: 30,
          assetUri: 'asset/images/open-book.png',
          leadingText: '도서관리',
          contentText: '도서를 등록/삭제합니다.',
          targetScreen: BookManageScreen(bookViewController: bookController),
        ),
        HomeScreenButton(
          padding: 30,
          assetUri: 'asset/images/group.png',
          leadingText: '회원관리',
          contentText: '회원을 등록/삭제합니다.',
          targetScreen: UserManageScreen(userController: userController),
        ),
        HomeScreenButton(
          padding: 30,
          assetUri: 'asset/images/digital-library.png',
          leadingText: '대출관리',
          contentText: '대출/반납을 실행합니다.',
          targetScreen: LoanManageScreen(loanController: loanController),
        ),
      ],
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton(
      {Key? key,
      required this.leadingText,
      required this.contentText,
      required this.padding,
      required this.targetScreen,
      this.assetUri})
      : super(key: key);
  final String leadingText;
  final String contentText;
  final Widget targetScreen;
  final String? assetUri;
  final double padding;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        child: FadeIn(
          child: Container(
            height: height / 6 < 150 ? 150 : height / 6,
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.orange[700]!, Colors.orange[900]!]),
            ),
            child: height > width
                ? Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width / 5,
                          height: height / 6,
                          child: assetUri != null
                              ? Image.asset(
                                  assetUri!,
                                )
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VerticalDivider(
                          thickness: 1,
                          color: Colors.orange[900],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                            fontSize: width / 32 < 16 ? 16 : width / 32,
                            color: Colors.black),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              leadingText,
                              style: TextStyle(
                                  fontSize: width / 28 < 20 ? 20 : width / 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(contentText),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: width / 5,
                            height: height / 6,
                            child: assetUri != null
                                ? Image.asset(
                                    assetUri!,
                                  )
                                : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Colors.black),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                              fontSize: width / 40 < 16 ? 16 : width / 40,
                              color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  leadingText,
                                  style: TextStyle(
                                      fontSize: width / 28 < 20 ? 20 : width / 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(contentText),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
