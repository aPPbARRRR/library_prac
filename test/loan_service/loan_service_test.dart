import 'package:flutter_test/flutter_test.dart';
import 'package:library_manage_app/library_app/src/data/repository/database_repository.dart';
import 'package:library_manage_app/library_app/src/data/source/csv_database_repository_impl.dart';
import 'package:library_manage_app/library_app/src/service/impl/loan_service_impl.dart';
import 'package:library_manage_app/library_app/src/service/interface/loan_service.dart';

void main () {
  test('LoanService ok', () async {

    DatabaseRepository repository = CSVdatabaseRepositoryImpl();
    LoanService loanService = LoanServiceImpl(repository: repository);

    expect(await loanService.getbookLoans(), await repository.getBookLoans());
  });
}