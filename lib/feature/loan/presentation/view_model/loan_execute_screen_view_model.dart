import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';
import 'package:library_manage_app/feature/loan/domain/usecase/loan_service.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';

import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/user.dart';

class LoanExecuteScreenViewModel extends ChangeNotifier {
  LoanExecuteScreenViewModel({required this.loanService});
  final LoanService loanService;
  User? user;
  Book? book;

  Future<void> goToUserSearchScreen(BuildContext context) async {
    user = await context.pushNamed(AppRoutes.loanUserSearch);
    notifyListeners();
  }

  Future<void> goToBookSearchScreen(BuildContext context) async {
    book = await context.pushNamed(AppRoutes.loanBookSearch);
    notifyListeners();
  }

  void onSelectedUserTileTapped() {
    user = null;
    notifyListeners();
  }

  void onSelectedBookTileTapped() {
    book = null;
    notifyListeners();
  }

  Future<void> executeLoan(BuildContext context) async {
    if (book != null && user != null && !book!.isBookLoaned) {
      // 대출 요청
      var result = await loanService.loanBook(user: user!, book: book!);
      // 대출 요청 성공시 대출 상세 페이지로 push
      if (context.mounted) {
        switch (result) {
          case Success<BookLoan, Exception>():
            context.pushNamed(AppRoutes.loanSingle, extra: result.result);
          case Error<BookLoan, Exception>():
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('대출 실행에 실패하였습니다. ${result.e}')));
        }
      }
    } else if (book != null && book!.isBookLoaned) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('이미 대출중인 도서입니다.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('대상 회원과 도서를 선택해주세요.')));
    }
  }
}
