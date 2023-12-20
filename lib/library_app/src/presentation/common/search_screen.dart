import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/enums/fileter.dart';
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
  UserSearchFilter userSearchFilter = UserSearchFilter.name;

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
<<<<<<< HEAD
                    decoration: const InputDecoration(hintText: '검색어를 입력해주세요.'),
                    onChanged: (val) {
                      if (widget.searchType == SearchType.user)
                        resultUsers =
                            loanController.retrieveUserFromName(name: val);
                      if (widget.searchType == SearchType.book)
                        resultBooks =
                            loanController.retrieveBooksFromName(bookName: val);
                      setState(() {});
=======
                    decoration: InputDecoration(hintText: '검색어를 입력해주세요.'),
                    onChanged: (val) async {
                      targets = await loanController.retrieveUsers(
                          users: targets ?? [], searchFilter: userSearchFilter);
                          print(targets);
                          print(1);
                      setState(() {
                        // targets = loanController.users
                        //         ?.where((user) => user.name.contains(val))
                        //         .toList() ??
                        //     null;
                      });
>>>>>>> main
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
<<<<<<< HEAD
                resultUsers == null
=======
                targets == null
>>>>>>> main
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: ListView(
                          children: [
<<<<<<< HEAD
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
=======
                            if (targets != null)
                              ...targets!
                                  .map((user) => UserTile(user: user))
                                  .toList()
>>>>>>> main
                          ],
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
