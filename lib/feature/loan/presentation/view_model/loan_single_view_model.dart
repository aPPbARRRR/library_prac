import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';
import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';
import 'package:library_manage_app/feature/loan/domain/usecase/loan_service_impl.dart';
import 'package:library_manage_app/feature/user/domain/model/user_search_type.dart';
import 'package:library_manage_app/feature/user/domain/usecase/user_service_impl.dart';
import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:provider/provider.dart';

import '../../../book/domain/usecase/book_service_impl.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/user.dart';

class LoanSingleViewModel extends ChangeNotifier {
  LoanSingleViewModel({required this.loan});
  BookLoan loan;
  User? user;
  Book? book;
  int loanExtendDays = 7;
  final availableExtendDays = [1, 2, 3, 4, 5, 6, 7];

  Future<void> onBuild(BuildContext context) async {
    if (context.mounted) {
      await getUser(loan, context);
    }
    if (context.mounted) {
      await getBook(loan, context);
    }
  }

  Future<void> getUser(BookLoan loan, BuildContext context) async {
    var result = await context
        .read<UserServiceProvider>()
        .userService
        .retrieveUser(
            searchText: loan.userUid, userSearchType: UserSearchType.uid);
    if (context.mounted) {
      switch (result) {
        case Success<List<User>, Exception>():
          user = result.result[0];
        case Error<List<User>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('사용자를 검색할 수 없습니다.')));
      }
    }
  }

  Future<void> getBook(BookLoan loan, BuildContext context) async {
    var result = await context
        .read<BookServiceProvider>()
        .bookService
        .retrieveBooks(
            searchText: loan.bookUid, bookSearchType: BookSearchType.uid);
    if (context.mounted) {
      switch (result) {
        case Success<List<Book>, Exception>():
          book = result.result[0];
        case Error<List<Book>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('대상도서를 검색할 수 없습니다.')));
      }
    }
  }

  void selectExtendDays(int value) {
    loanExtendDays = value;
    notifyListeners();
  }

  // 대출연장
  Future<void> extendsLoan({required BuildContext context}) async {
    var result = await context
        .read<LoanServiceProvider>()
        .loanService
        .extendLoan(loan: loan);
    if (context.mounted) {
      switch (result) {
        case Success<BookLoan, Exception>():
          loan = result.result;
          notifyListeners();
        case Error<BookLoan, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('대출 연장에 실패하였습니다.')));
      }
    }
  }

  // 반납처리
  Future<void> returnLoan({required BuildContext context}) async {
    var result = await context
        .read<LoanServiceProvider>()
        .loanService
        .returnBook(loan: loan);
    if (context.mounted) {
      switch (result) {
        case Success<BookLoan, Exception>():
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${book!.bookName} 도서가 반납되었습니다.')));
          context.pop();
        case Error<BookLoan, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('도서 반납에 실패하였습니다.')));
      }
    }
  }
}
