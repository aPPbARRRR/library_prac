import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/presentation/common/view_controller.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import 'widget/book_tile.dart';

enum SearchType { user, book, loan }

class SearchScreen extends StatefulWidget {
  SearchScreen(
      {super.key, required this.controller, required this.searchType, this.onTileTapped});

  final ViewController controller;
  final SearchType searchType;
  final VoidCallback? onTileTapped;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User>? resultUsers;
  List<Book>? resultBooks;
  List<BookLoan>? reslutLoans;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    resultUsers = widget.controller.users;
    resultBooks = widget.controller.books;
    reslutLoans = widget.controller.loans;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ViewController controller = widget.controller;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(hintText: '검색어를 입력해주세요.'),
                    onChanged: (val) {
                      if (widget.searchType == SearchType.user)
                        resultUsers =
                            controller.retrieveUserFromName(name: val);
                      if (widget.searchType == SearchType.book)
                        resultBooks =
                            controller.retrieveBooksFromName(bookName: val);
                        //     if (widget.searchType == SearchType.loan)
                        // reslutLoans =
                        //     controller.retrieveLoansFromBookName(bookName: val);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                resultUsers == null
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: ListView(
                          children: [
                            if (resultUsers != null &&
                                widget.searchType == SearchType.user)
                              ...resultUsers!
                                  .map((user) => UserTile(user: user , onTap: widget.onTileTapped  ))
                                  .toList()
                            else if (resultBooks != null &&
                                widget.searchType == SearchType.book)
                              ...resultBooks!
                                  .map((book) => BookTile(book: book, onTap: widget.onTileTapped))
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
