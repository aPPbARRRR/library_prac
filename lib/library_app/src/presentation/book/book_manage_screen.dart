import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/book/resister_book_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/common/search_screen.dart';

import 'book_view_controller.dart';
import 'book_single_view.dart';

class BookManageScreen extends StatefulWidget {
  const BookManageScreen({super.key, required this.bookViewController});
  final BookViewController bookViewController;

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
          ResisterBookScreen(
            bookViewController: widget.bookViewController,
          ),
          SearchScreen(
            controller: widget.bookViewController,
            searchType: SearchType.book,
            onTileTapped: (book) {
              // 유저 상세 페이지로 이동(회원관리 / 회원검색 / 회원타일 에 한해서 onTileTapped가 그렇게 작동하는 것임.)
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookSingleView(book: book, controller: widget.bookViewController)));
            },
          )
        ][currentPageIndex],
      ),
    );
    
  }
}

void testFunc (int i) {
  i++;
}