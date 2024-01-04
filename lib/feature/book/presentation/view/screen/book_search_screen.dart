import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_search_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_text_field_with_label.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/custom_button.dart';
import 'package:provider/provider.dart';
import '../../../../../library_app/src/presentation/common/widget/book_tile.dart';
import '../../../../common/domain/enum/search_type.dart';

class BookSearchScreen extends StatelessWidget {
  BookSearchScreen({super.key, this.isBackButtonEnabled = false});

  final bool isBackButtonEnabled;

  final TextEditingController textController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookSearchScreenViewModel>();

    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text(viewModel.appBarTitleText),
            leading: IconButton(
                onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
            // automaticallyImplyLeading: isBackButtonEnabled,
            // toolbarHeight: isBackButtonEnabled ? null : 0,
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFieldWithLabel(
                    textController: textController,
                    hintText: viewModel.searchHintText,
                    onPressed: () {
                      if (textController.text == '')
                        viewModel.getAllBooks(context: context);
                      else {
                        viewModel.search(
                            searchText: textController.text, context: context);
                      }
                    },
                    icon: Icon(Icons.search, color: Colors.orange),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (viewModel.resultBooks != null &&
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
