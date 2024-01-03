import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class BookManageScreen extends StatefulWidget {
//   const BookManageScreen({super.key});

//   @override
//   State<BookManageScreen> createState() => _BookManageScreenState();
// }

// class _BookManageScreenState extends State<BookManageScreen> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(currentPageIndex == 0 ? '신규 도서 입고' : '도서 검색'),
//         ),
//         bottomNavigationBar: NavigationBar(
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPageIndex = index;
//             });
//           },
//           indicatorColor: Colors.orange[900],
//           selectedIndex: currentPageIndex,
//           destinations: const <Widget>[
//             NavigationDestination(
//               icon: Icon(Icons.group_add),
//               label: '도서 등록',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.group_remove),
//               label: '도서 검색',
//             ),
//           ],
//         ),
//         body: [
//           ResisterBookScreen(),
//           SearchScreen(
//             searchType: SearchType.book,
//             onTileTapped: (book) {
//               // 유저 상세 페이지로 이동(회원관리 / 회원검색 / 회원타일 에 한해서 onTileTapped가 그렇게 작동하는 것임.)
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => BookSingleView()));
//             },
//           )
//         ][currentPageIndex],
//       ),
//     );
//   }
// }

class BookManageScreen extends StatelessWidget {
  const BookManageScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange[900],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.group_add), label: '도서 등록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_remove), label: '도서 검색'),
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
