import 'package:flutter/material.dart';
import 'package:library_manage_app/feature/book/domain/model/book_search_type.dart';
import 'package:library_manage_app/feature/book/domain/repository/book_repository.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/shared/data/drift/drift_database.dart';

class DriftBookRepositoryImpl implements BookRepository {
  final AppDatabase db = AppDatabase();

  @override
  Future<List<Book>> getAllBooks() {
    // TODO: implement getAllBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> retrieveBooks(
      {required String searchText, required BookSearchType bookSearchType}) {
    // TODO: implement getBook
    // 서치타입이 uid일 경우 한 권만 반환됨. 리스트로 반환하고 한 권을 선택하는 작업은 유즈케이스에서 담당.
    // 검색결과가 없는 경우 처리는 유즈케이스에서 하는 것이 맞을듯. 얘는 db랑 통신만 하는거니까
    throw UnimplementedError();
  }

  @override
  Future<Book> registerBook({required Book book}) {
    print(book.bookName);
    throw UnimplementedError();
  }

  @override
  Future<void> unregisterBook({required Book book}) {
    // TODO: implement unregisterBook
    throw UnimplementedError();
  }

  @override
  Future<Book> updateBook({required Book book}) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }

  // @override
  // Future<User> createUser({required User user}) async {
  //   UserTableData? data;
  //   var result = await db.createUser(user.toTableCompanion());
  //   if (result == null)
  //     throw Exception('repository / createUser / result : Failed');
  //   await db.getUser(user.userUid).then((value) => value.length < 1
  //       ? throw Exception('repository / createUser / getUser : Failed')
  //       : data = value[0]);
  //   return User(
  //       userUid: data!.userUid,
  //       name: data!.name,
  //       address: data!.address,
  //       phoneNum: data!.phoneNum,
  //       birthDate: data!.birthDate,
  //       registrationDate: data!.resistrationDate);
  // }

  // @override
  // Future<List<User>> getUsers() async {
  //   print('drift repository / getUsers');
  //   // var allUsersDataTable =await db.select(db.userTable).get();
  //   List<UserTableData> allUsersDataTable = await db.selectAllUsers();
  //   return allUsersDataTable
  //       .map((userdataTable) => User(
  //           userUid: userdataTable.userUid,
  //           name: userdataTable.name,
  //           address: userdataTable.address,
  //           phoneNum: userdataTable.phoneNum,
  //           birthDate: userdataTable.birthDate,
  //           registrationDate: userdataTable.resistrationDate))
  //       .toList();
  // }

  // // 책 대출 실행
  // @override
  // Future<BookLoan> executeLoan({required User user, required Book book}) async {
  //   BookLoan loan = BookLoan(
  //       loanUid: Uuid().v4(),
  //       bookUid: book.bookUid,
  //       userUid: user.userUid,
  //       loanDate: DateTime.now(),
  //       dueDate: DateTime.now().add(Duration(days: 14)),
  //       isReturned: false,
  //       isExtended: false);
  //   LoanTableData? data;

  //   // 로컬 db에 데이터 저장
  //   await db.into(db.loanTable).insert(loan.toTableCompanion());

  //   // 저장된 데이터를 db에서 꺼내서 return할 지역변수에 저장
  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);

  //   // return 전 데이터베이스 최신화 : 도서(서고보관중 -> 대여중)
  //   await (db.update(db.bookTable)
  //         ..where((tbl) => tbl.bookUid.equals(data!.bookUid)))
  //       .write(BookTableCompanion(isBookLoaned: d.Value(true)));

  //   // BookLoan 객체 생성하여 return
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }

  // @override
  // Future<List<BookLoan>> getBookLoans() async {
  //   List<LoanTableData> allLoansDataTable = await db.selectAllLoans();
  //   return allLoansDataTable
  //       .map((loanDataTable) => BookLoan(
  //           bookUid: loanDataTable.bookUid,
  //           dueDate: loanDataTable.dueDate,
  //           loanDate: loanDataTable.loanDate,
  //           loanUid: loanDataTable.loanUid,
  //           userUid: loanDataTable.userUid,
  //           isReturned: loanDataTable.isReturned,
  //           isExtended: loanDataTable.isExtended))
  //       .toList();
  // }

  // @override
  // Future<List<Book>> getBooks() async {
  //   List<BookTableData> allBooksDataTable = await db.selectAllBooks();
  //   return allBooksDataTable
  //       .map((bookDataTable) => Book(
  //           bookName: bookDataTable.bookName,
  //           bookUid: bookDataTable.bookUid,
  //           publishDate: bookDataTable.publishDate,
  //           isBookLoaned: bookDataTable.isBookLoaned,
  //           author: bookDataTable.author))
  //       .toList();
  // }

  // @override
  // Future<Book> registerBook({required Book book}) async {
  //   BookTableData? data;
  //   var result = await db.into(db.bookTable).insert(book.toTableCompanion());
  //   if (result == null)
  //     throw Exception('repository / resisterBook / result : Failed');
  //   await db.getBook(book.bookUid).then((value) => value.length < 1
  //       ? throw Exception('repository / resisterBook / getBook : Failed')
  //       : data = value[0]);

  //   return Book(
  //       bookName: data!.bookName,
  //       bookUid: data!.bookUid,
  //       publishDate: data!.publishDate,
  //       isBookLoaned: data!.isBookLoaned,
  //       author: data!.author);
  // }

  // @override
  // Future<void> removeUser({required User user}) async {
  //   await (db.delete(db.userTable)
  //         ..where((tbl) => tbl.userUid.equals(user.userUid)))
  //       .go();
  // }

  // @override
  // Future<BookLoan> returnBookLoan({required BookLoan loan}) async {
  //   LoanTableData? data;

  //   await (db.update(db.loanTable)
  //         ..where((tbl) => tbl.loanUid.equals(loan.loanUid)))
  //       .write(LoanTableCompanion(isReturned: d.Value(true)));

  //   // return 전 데이터베이스 최신화 : 도서(대여중 -> 서고보관중)
  //   await (db.update(db.bookTable)
  //         ..where((tbl) => tbl.bookUid.equals(loan.bookUid)))
  //       .write(BookTableCompanion(isBookLoaned: d.Value(false)));

  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }

  // @override
  // Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day}) async {
  //   LoanTableData? data;
  //   await (db.update(db.loanTable)
  //         ..where((tbl) => tbl.loanUid.equals(loan.loanUid)))
  //       .write(LoanTableCompanion(
  //           dueDate: d.Value(loan.dueDate.add(Duration(days: day ?? 7))),
  //           isExtended: d.Value(true)));
  //   await db.getLoan(loan.loanUid).then((value) => value.length < 1
  //       ? throw Exception('repository / executeLoan / getLoan : Failed')
  //       : data = value[0]);
  //   return BookLoan(
  //       loanUid: data!.loanUid,
  //       bookUid: data!.bookUid,
  //       userUid: data!.userUid,
  //       loanDate: data!.loanDate,
  //       dueDate: data!.dueDate,
  //       isReturned: data!.isReturned,
  //       isExtended: data!.isExtended);
  // }

  // @override
  // Future<File> saveBackUpDataAsCSV(
  //     {required List<User> users,
  //     required List<Book> books,
  //     required List<BookLoan> bookLoans}) {
  //   // TODO: implement saveBackUpDataAsCSV
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> unregisterBook({required Book book}) {
  //   // TODO: implement unregisterBook
  //   throw UnimplementedError();
  // }
}