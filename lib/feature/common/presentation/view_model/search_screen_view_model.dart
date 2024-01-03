// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:library_manage_app/library_app/src/entity/book_loan_extention.dart';
import 'package:library_manage_app/shared/domain/model/app_data.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../library_app/src/entity/book.dart';
import '../../../../library_app/src/entity/book_loan.dart';
import '../../../../library_app/src/entity/user.dart';
import '../../domain/model/search_type.dart';

class SearchScreenViewModel extends ChangeNotifier {
  final SearchType searchType;
  List<User>? resultUsers;
  List<Book>? resultBooks;
  List<BookLoan>? resultLoans;
  bool isExpirationDateBasedSort = true;
  bool isAscendingSorted = false;
  SearchScreenViewModel({
    required this.searchType,
  });

  String get searchHintText => switch (searchType) {
        SearchType.book => '도서명을 입력해주세요.',
        SearchType.user => '회원 이름을 입력해주세요.',
        SearchType.loan => '대출번호를 입력해주세요.'
      };

  Function? onTileTapped(AppData data, BuildContext context) {
    if (data is Book) {
      //타일 탭의 뷰모델에 data(book으로 들어온 경우)를 최신화시키는 작업 선행해야함
      context.goNamed(AppRoutes.bookSingle);
    }
// (loan) {
//                    context.goNamed( LoanSingleView(
//                                 loan: loan,
//                                 loanViewController: widget.loanController,
//                               )); // 론 싱글 뷰 앱 라우츠, 앱 라우터에 추가 요망

//                     }
// (user) {
//      context.goNamed( UserSingleView(
//                         user: user,
//                         controller: widget.userController,
//                       )); // 론 싱글 뷰 앱 라우츠, 앱 라우터에 추가 요망

//             }
  }

  // if (widget.searchType == SearchType.book) searchHintText = ;
  // if (widget.searchType == SearchType.user) searchHintText
  // if (widget.searchType == SearchType.loan) searchHintText =
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
}
