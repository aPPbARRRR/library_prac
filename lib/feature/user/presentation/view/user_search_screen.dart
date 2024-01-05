import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_text_field_with_label.dart';
import 'package:provider/provider.dart';
import '../../../common/presentation/widget/user_tile.dart';
import '../view_model/user_search_screen_view_model.dart';

class UserSearchScreen extends StatelessWidget {
  UserSearchScreen({super.key, this.isBackButtonEnabled = false});

  final bool isBackButtonEnabled;

  final TextEditingController textController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserSearchScreenViewModel>();

    return SafeArea(
      child: Scaffold(
          key: _key,
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFieldWithLabel(
                    textController: textController,
                    hintText: viewModel.searchHintText,
                    onPressed: () => viewModel.search(
                        searchText: textController.text, context: context),
                    icon: Icon(Icons.search, color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (viewModel.resultUsers != null &&
                          viewModel.resultUsers!.isNotEmpty)
                        ...viewModel.resultUsers!
                            .map((user) => UserTile(
                                user: user,
                                onTap: (user) => viewModel.onTileTapped(
                                    context: context, user: user)))
                            .toList()
                      else
                        const Center(child: Text('검색결과가 없습니다.'))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
