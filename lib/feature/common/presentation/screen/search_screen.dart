import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/presentation/view_model/search_screen_view_model.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:provider/provider.dart';
import '../../../../library_app/src/presentation/common/widget/book_tile.dart';
import '../../domain/model/search_type.dart';
import '../widget/loan_search_screen_drawer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key, this.isBackButtonEnabled = false});

  final bool isBackButtonEnabled;

  final TextEditingController textController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchScreenViewModel>();

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: viewModel.resultLoans != null &&
                  viewModel.searchType == SearchType.loan
              ? Drawer(
                  child: LoanSearchScreenDrawer(viewModel: viewModel),
                )
              : null,
          appBar: AppBar(
            title: Text(switch (viewModel.searchType) {
              SearchType.user => '회원 검색',
              SearchType.book => '도서 검색',
              SearchType.loan => '대출 검색',
            }),
            automaticallyImplyLeading: isBackButtonEnabled,
            toolbarHeight: isBackButtonEnabled ? null : 0,
          ),
          body: Center(
            child: Column(
              children: [
                if ((viewModel.resultLoans != null &&
                    viewModel.searchType == SearchType.loan))
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
                                viewModel.isAscendingSorted
                                    ? '오름차순 정렬'
                                    : '내림차순 정렬',
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
                                viewModel.isExpirationDateBasedSort
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
                    decoration:
                        InputDecoration(hintText: viewModel.searchHintText),
                    onChanged: (val) {
                      // if (viewModel.searchType == SearchType.user)
                      //   resultUsers =
                      //       controller.retrieveUserFromName(name: val);
                      // if (viewModel.searchType == SearchType.book)
                      //   resultBooks =
                      //       controller.retrieveBooksFromName(bookName: val);
                      // if (viewModel.searchType == SearchType.loan)
                      //   resultLoans =
                      //       controller.retrieveLoansFromLoanUid(loanUid: val);
                      // setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (viewModel.resultUsers != null &&
                          viewModel.searchType == SearchType.user)
                        ...viewModel.resultUsers!
                            .map((user) => UserTile(
                                user: user, onTap: viewModel.onTileTapped))
                            .toList()
                      else if (viewModel.resultBooks != null &&
                          viewModel.searchType == SearchType.book)
                        ...viewModel.resultBooks!
                            .map((book) => BookTile(
                                book: book, onTap: viewModel.onTileTapped))
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
