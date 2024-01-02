import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/presentation/common/search_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/repository_impl/book_service_impl.dart';
import '../../view_model/resister_book_screen_view_model.dart';
import 'book_single_view.dart';
import 'resister_book_screen.dart';

class BookManageScreen extends StatefulWidget {
  const BookManageScreen({super.key});

  @override
  State<BookManageScreen> createState() => _BookManageScreenState();
}

class _BookManageScreenState extends State<BookManageScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentPageIndex == 0 ? '신규 도서 입고' : '도서 검색'),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.orange[900],
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.group_add),
              label: '도서 등록',
            ),
            NavigationDestination(
              icon: Icon(Icons.group_remove),
              label: '도서 검색',
            ),
          ],
        ),
        body: [
          ResisterBookScreen(),
          SearchScreen(
            searchType: SearchType.book,
            onTileTapped: (book) {
              // 유저 상세 페이지로 이동(회원관리 / 회원검색 / 회원타일 에 한해서 onTileTapped가 그렇게 작동하는 것임.)
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookSingleView()));
            },
          )
        ][currentPageIndex],
      ),
    );
  }
}

// class ScaffoldWithNavBar extends StatelessWidget {
//   const ScaffoldWithNavBar({
//     required this.navigationShell,
//     Key? key,
//   }) : super(key: key);

//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider(
//           create: (context) => ResisterBookScreenViewModel(
//               bookService: context.watch<BookServiceProvider>().bookService),
//           child: navigationShell),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: '도서 등록'),
//           BottomNavigationBarItem(icon: Icon(Icons.work), label: '도서 검색'),
//         ],
//         currentIndex: navigationShell.currentIndex,
//         onTap: (int index) => _onTap(context, index),
//       ),
//     );
//   }

//   void _onTap(BuildContext context, int index) {
//     navigationShell.goBranch(
//       index,
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
// }
