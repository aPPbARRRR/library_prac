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
  Future<List<BookLoan>> getAllLoans() async {
    List<BookLoan> allLoans = await repository.getBookLoans();
    // allLoans.sort((a, b) => a.remainingLoanDays.compareTo(b.remainingLoanDays)); // 대출기간 짧은 대출이 앞으로 가게 반환함.
    return allLoans;
  }

  @override
  void extendLoan({required BookLoan loan}) {
    // TODO: implement extendLoan
  }

  @override
  Future<BookLoan> loanBook({required User user, required Book book}) async {
    return await repository.executeLoan(user: user, book: book);
  }

  @override
  void returnBook({required BookLoan loan}) {
    // TODO: implement returnBook
  }

  @override
  List<BookLoan> retrieveLoansFromLoanUid(
          {required List<BookLoan> loans, required String loanUid}) =>
      loans.where((loan) => loan.loanUid.contains(loanUid)).toList();
}
