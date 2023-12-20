import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_controller.dart';

import '../../entity/book.dart';
import '../../entity/user.dart';
import 'widget/book_tile.dart';

enum SearchType { user, book }

class SearchScreen extends StatefulWidget {
  SearchScreen(
      {super.key, required this.loanController, required this.searchType});

  final LoanController loanController;
  final SearchType searchType;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User>? resultUsers;
  List<Book>? resultBooks;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    resultUsers = widget.loanController.users;
    resultBooks = widget.loanController.books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoanController loanController = widget.loanController;

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
                            loanController.retrieveUserFromName(name: val);
                      if (widget.searchType == SearchType.book)
                        resultBooks =
                            loanController.retrieveBooksFromName(bookName: val);
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
                                  .map((user) => UserTile(user: user))
                                  .toList()
                            else if (resultBooks != null &&
                                widget.searchType == SearchType.book)
                              ...resultBooks!
                                  .map((book) => BookTile(book: book))
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
