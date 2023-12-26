import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan_extention.dart';
import 'package:library_manage_app/library_app/src/presentation/common/view_controller.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import 'widget/book_tile.dart';
import 'widget/loan_tile.dart';

enum SearchType { user, book, loan }

class SearchScreen extends StatefulWidget {
  SearchScreen(
      {super.key,
      required this.controller,
      required this.searchType,
      this.onTileTapped,
      this.isBackButtonEnabled = false});

  final ViewController controller;
  final SearchType searchType;
  final Function? onTileTapped;
  final bool isBackButtonEnabled;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User>? resultUsers;
  List<Book>? resultBooks;
  List<BookLoan>? resultLoans;
  final TextEditingController textController = TextEditingController();
  late final String searchHintText;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // bool isLoanDateBasedSort = false;
  bool isExpirationDateBasedSort = true;
  bool isAscendingSorted = false;

  @override
  void initState() {
    resultUsers = widget.controller.users;
    resultBooks = widget.controller.books;
    resultLoans = widget.controller.loans;
    if (widget.searchType == SearchType.book) searchHintText = '도서명을 입력해주세요.';
    if (widget.searchType == SearchType.user) searchHintText = '회원 이름을 입력해주세요.';
    if (widget.searchType == SearchType.loan) searchHintText = '대출번호를 입력해주세요.';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ViewController controller = widget.controller;

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: resultLoans != null && widget.searchType == SearchType.loan
              ? Drawer(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('정렬방식',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                resultLoans = resultLoans?.sorted((a, b) =>
                                    a.remainingDays.compareTo(b.remainingDays));

                                isAscendingSorted = true;
                              });
                            },
                            child: Text(
                              '오름차순',
                              style: isAscendingSorted
                                  ? TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)
                                  : null,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                resultLoans = resultLoans?.sorted((a, b) =>
                                    b.remainingDays.compareTo(a.remainingDays));
                                isAscendingSorted = false;
                              });
                            },
                            child: Text(
                              '내림차순',
                              style: !isAscendingSorted
                                  ? TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)
                                  : null,
                            )),
                        Divider(),
                        Text('정렬기준',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                resultLoans?.sort(
                                    (a, b) => a.loanDate.compareTo(b.loanDate));
                                isExpirationDateBasedSort = false;
                              });
                            },
                            child: Text(
                              '대출 실행일 기준',
                              style: !isExpirationDateBasedSort
                                  ? TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)
                                  : null,
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                resultLoans?.sort((a, b) =>
                                    a.remainingDays.compareTo(b.remainingDays));
                                isExpirationDateBasedSort = true;
                              });
                            },
                            child: Text(
                              '대출 잔여일 기준',
                              style: isExpirationDateBasedSort
                                  ? TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)
                                  : null,
                            )),
                      ]),
                )
              : null,
          appBar: AppBar(
            title: Text(switch (widget.searchType) {
              SearchType.user => '회원 검색',
              SearchType.book => '도서 검색',
              SearchType.loan => '대출 검색',
            }),
            automaticallyImplyLeading: widget.isBackButtonEnabled,
            toolbarHeight: widget.isBackButtonEnabled ? null : 0,
          ),
          body: Center(
            child: Column(
              children: [
                if ((resultLoans != null &&
                    widget.searchType == SearchType.loan))
                  GestureDetector(
                    onTap: () => _key.currentState?.openDrawer(),
                    child: SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(
                                isAscendingSorted ? '오름차순 정렬' : '내림차순 정렬',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.orange[900],
                              side: BorderSide.none,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(
                              label: Text(
                                isExpirationDateBasedSort
                                    ? '대출 잔여일 기준'
                                    : '대출 시행일 기준',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.orange[900],
                              side: BorderSide.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: searchHintText),
                    onChanged: (val) {
                      if (widget.searchType == SearchType.user)
                        resultUsers =
                            controller.retrieveUserFromName(name: val);
                      if (widget.searchType == SearchType.book)
                        resultBooks =
                            controller.retrieveBooksFromName(bookName: val);
                      if (widget.searchType == SearchType.loan)
                        resultLoans =
                            controller.retrieveLoansFromLoanUid(loanUid: val);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (resultUsers != null &&
                          widget.searchType == SearchType.user)
                        ...resultUsers!
                            .map((user) => UserTile(
                                user: user, onTap: widget.onTileTapped))
                            .toList()
                      else if (resultBooks != null &&
                          widget.searchType == SearchType.book)
                        ...resultBooks!
                            .map((book) => BookTile(
                                book: book, onTap: widget.onTileTapped))
                            .toList()
                      else if (resultLoans != null &&
                          widget.searchType == SearchType.loan)
                        ...resultLoans!
                            .map((loan) => LoanTile(
                                loan: loan,
                                onTap: widget.onTileTapped,
                                users: widget.controller.users,
                                books: widget.controller.books))
                            .toList()
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
