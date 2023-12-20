import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/enums/fileter.dart';
import 'package:library_manage_app/library_app/src/presentation/common/widget/user_tile.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_controller.dart';

import '../../entity/user.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, required this.loanController});

  final LoanController loanController;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User>? targets;
  final TextEditingController textController = TextEditingController();
  UserSearchFilter userSearchFilter = UserSearchFilter.name;

  @override
  void initState() {
    targets = widget.loanController.users;
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
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                targets == null
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: ListView(
                          children: [
                            if (targets != null)
                              ...targets!
                                  .map((user) => UserTile(user: user))
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
