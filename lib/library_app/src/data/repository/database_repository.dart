import 'dart:io';

import '../../entity/book.dart';
import '../../entity/book_loan.dart';
import '../../entity/user.dart';

abstract interface class DatabaseRepository {
  // 리포지터리는 dto를 이용해 변환된 결과값을 반환할 수 있다.
  // 실제로 task 수행하는 임플에서 dto 사용해주면 됨.

// 도서관 전체 책 목록 반환
  Future<List<Book>> getBooks();

  // 도서관 전체 회원 목록 반환
  Future<List<User>> getUsers();

  // 도서관 전체 대출 목록 반환
  Future<List<BookLoan>> getBookLoans();

  // 대출 실행시 데이터베이스에 저장 후 대출모델로 반환
  Future<BookLoan> executeLoan({required User user, required Book book});

  // 반납시 데이터베이스에 저장
  Future<BookLoan> returnBookLoan({required BookLoan loan});

  // 대출 연장
  Future<BookLoan> extendLoanDueDate({required BookLoan loan, int? day});

  // 회원 등록
  Future<User> createUser({required User user});

  // 회원 삭제
  Future<void> removeUser({required User user});

  // 신규 도서 입고
  Future<Book> registerBook({required Book book});

  // 도서 삭제
  Future<void> unregisterBook({required Book book});

// CSV파일로 db 데이터를 백업 후 파일을 반환
  Future<File> saveBackUpDataAsCSV(
      {required List<User> users,
      required List<Book> books,
      required List<BookLoan> bookLoans});
}
