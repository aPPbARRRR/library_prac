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
                  backgroundColor: Colors.black,
                  expandedHeight: MediaQuery.of(context).size.height / 3,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  flexibleSpace: CustomFlexibleSpaceBar(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 2 / 3 -
                          kToolbarHeight,
                      child: AppTaskButtonSection(
                          loanController: loanController,
                          userController: userController,
                          bookController: bookController),
                    ),
                  ),
                ),
                BottomSectionSliverGrid(),
              ],
            ),
          );
        });
  }
}

class BottomSectionSliverGrid extends StatelessWidget {
  const BottomSectionSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
    );
  }
}

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
        child: Image.asset(
          'asset/images/app_bar_back_image.png',
          fit: BoxFit.fill,
        ),
      ),
    );
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTappableButton(
                targetScreen: LoanManageScreen(loanController: loanController),
                text: '대출관리',
              ),
              Expanded(
                child: Column(
                  children: [
                    CustomTappableButton(
                      targetScreen:
                          UserManageScreen(userController: userController),
                      text: '회원관리',
                    ),
                    CustomTappableButton(
                      targetScreen:
                          BookManageScreen(bookViewController: bookController),
                      text: '도서관리',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTappableButton extends StatelessWidget {
  const CustomTappableButton(
      {Key? key, required this.text, this.imgUrl, required this.targetScreen})
      : super(key: key);

  final String text;
  final String? imgUrl;
  final Widget targetScreen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 1)
              
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
