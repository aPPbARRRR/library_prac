// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';

import 'package:library_manage_app/shared/drift/model/book_loan_extention.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../shared/domain/model/result.dart';
import '../../domain/usecase/book_service.dart';
import '../../../common/domain/enum/search_type.dart';
import '../../../common/domain/model/book.dart';
import '../../../common/domain/model/book_loan.dart';
import '../../../common/domain/model/user.dart';

class BookSearchScreenViewModel extends ChangeNotifier {
  BookSearchScreenViewModel(
      {required this.searchType, required this.bookService});

  final BookService bookService;

  final SearchType searchType;
  List<User>? resultUsers;
  List<Book>? resultBooks;
  List<BookLoan>? resultLoans;
  bool isExpirationDateBasedSort = true;
  bool isAscendingSorted = false;
  BookSearchType currentBookSearchType = BookSearchType.name;

  String get searchHintText => '도서명을 입력해주세요.';
  String get appBarTitleText => '도서 검색';

  void onTileTapped({required Book book, required BuildContext context}) {
    context.goNamed(AppRoutes.bookSingle, extra: book);
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

  Future<void> search(
      {required String searchText, required BuildContext context}) async {
    var result = await bookService.retrieveBooks(
        bookSearchType: currentBookSearchType, searchText: searchText);
    if (context.mounted) {
      switch (result) {
        case Success<List<Book>, Exception>():
          resultBooks = result.result;
          notifyListeners();
        case Error<List<Book>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.e.toString())));
      }
    }
  }

  Future<void> getAllBooks({required BuildContext context}) async {
    var result = await bookService.getAllBooks();

    if (context.mounted) {
      switch (result) {
        case Success<List<Book>, Exception>():
          if (resultBooks != result.result) {
            resultBooks = result.result;
            notifyListeners();
          }
        case Error<List<Book>, Exception>():
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result.e.toString())));
      }
    }
  }
}
