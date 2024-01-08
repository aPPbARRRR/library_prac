import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/common/presentation/widget/custom_text_field_with_label.dart';
import 'package:provider/provider.dart';
import '../../../../common/presentation/widget/loan_tile.dart';
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFieldWithLabel(
                    textController: textController,
                    hintText: viewModel.searchHintText,
                    onPressed: () async => viewModel.search(
                        searchText: textController.text, context: context),
                    icon: const Icon(Icons.search, color: Colors.orange),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (viewModel.resultLoans != null &&
                          viewModel.resultLoans!.isNotEmpty)
                        ...viewModel.resultLoans!
                            .map((loan) => LoanTile(
                                loan: loan,
                                onTap: (loan) {
                                  viewModel.onTileTapped(
                                      context: context, loan: loan);
                                }))
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
