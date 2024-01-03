import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/user.dart';

class LoanExecuteScreenViewModel extends ChangeNotifier {
  User? user;
  Book? book;

  void goToUserSearchScreen(BuildContext context) async {
    //  user = await context.go
    //   Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => SearchScreen(
    //                                   isBackButtonEnabled: true,
    //                                 )));
    //                     setState(() {});
  }
}
