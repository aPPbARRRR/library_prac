import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/loan/domain/model/loan_search_type.dart';

import 'package:library_manage_app/shared/domain/model/result.dart';
import 'package:library_manage_app/shared/drift/model/book_loan_extention.dart';

import '../../../../config/router/app_routes.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';
import '../../domain/usecase/loan_service.dart';

class LoanSearchScreenViewModel extends ChangeNotifier {
  LoanSearchScreenViewModel({required this.loanService});

  final LoanService loanService;

  LoanSearchType loanSearchType = LoanSearchType.uid;
  List<User>? resultUsers;
  List<Book>? resultBooks;
  List<BookLoan>? resultLoans;
  bool isExpirationDateBasedSort = true;
  bool isAscendingSorted = false;

  String get searchHintText => '대출번호를 입력해주세요.';
  String get appBarTitleText => '도서대출 검색';

  void onTileTapped({required BookLoan loan, required BuildContext context}) {
    context.goNamed(AppRoutes.loanSingle, extra: loan);
  }

  void toggleIsAscendingSorted() {
    if (isAscendingSorted == false) {
      resultLoans = resultLoans
          ?.sorted((a, b) => a.remainingDays.compareTo(b.remainingDays));
      isAscendingSorted = true;
    } else {
      resultLoans = resultLoans
          ?.sorted((a, b) => b.remainingDays.compareTo(a.remainingDays));
      isAscendingSorted = false;
    }
    notifyListeners();
  }

  void toggleIsExpirationDateBasedSort() {
    if (isExpirationDateBasedSort == true) {
      resultLoans?.sort((a, b) => a.loanDate.compareTo(b.loanDate));
      isExpirationDateBasedSort = false;
    } else {
      resultLoans?.sort((a, b) => a.remainingDays.compareTo(b.remainingDays));
      isExpirationDateBasedSort = true;
    }
    notifyListeners();
  }

  void search(
      {required String searchText, required BuildContext context}) async {
    if (searchText == '') {
      var result = await loanService.getAllLoans();
      if (context.mounted) {
        switch (result) {
          case Success<List<BookLoan>, Exception>():
            resultLoans = result.result;
            notifyListeners();
          case Error<List<BookLoan>, Exception>():
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('검색 중 오류가 발생하였습니다.')));
        }
      }
    } else {
      var result = await loanService.retrieveLoans(
          loanSearchType: loanSearchType, searchText: searchText);
      if (context.mounted) {
        switch (result) {
          case Success<List<BookLoan>, Exception>():
            resultLoans = result.result;
            notifyListeners();
          case Error<List<BookLoan>, Exception>():
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('검색 중 오류가 발생하였습니다.')));
        }
      }
    }
  }
}
