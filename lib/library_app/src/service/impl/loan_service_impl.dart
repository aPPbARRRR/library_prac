// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/entity/book.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';
import 'package:library_manage_app/library_app/src/entity/user.dart';
import '../interface/loan_service.dart';

class LoanServiceImpl implements LoanService {
  final DatabaseRepository repository;
  LoanServiceImpl({
    required this.repository,
  });

  @override
  void extendLoan({required Book book}) {
    // TODO: implement extendLoan
  }

  @override
  Future<void> loanBook({required User user, required Book book}) async {
    // TODO: implement loanBook
  }

  @override
  void returnBook({required Book book}) {
    // TODO: implement returnBook
  }

  @override
  Future<List<BookLoan>> getAllLoans() async {
    List<BookLoan> allLoans = await repository.getBookLoans();
    allLoans.sort((a, b) => a.remainingLoanDays.compareTo(b.remainingLoanDays)); // 대출기간 짧은 대출이 앞으로 가게 반환함.
    return allLoans;
  }
}
