import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_search_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_text_field_with_label.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:provider/provider.dart';
import '../../../../common/domain/enum/search_type.dart';
import '../../view_model/loan_search_screen_view_model.dart';
import '../widget/loan_search_screen_drawer.dart';

class LoanSearchScreen extends StatelessWidget {
  LoanSearchScreen({super.key, this.isBackButtonEnabled = false});

  final bool isBackButtonEnabled;

  final TextEditingController textController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoanSearchScreenViewModel>();

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
            child: LoanSearchScreenDrawer(viewModel: viewModel),
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
                  child: CustomTextFieldWithLabel(
                    textController: textController,
                    hintText: viewModel.searchHintText,
                    onPressed: () {
                      // viewModel.search(searchText: textController.text);
                    },
                    icon: Icon(Icons.search, color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
