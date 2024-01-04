import 'package:drift/drift.dart' as d;

import '../../../feature/common/domain/model/book_loan.dart';
import '../repository/drift_database.dart';

extension BookLoanExtention on BookLoan {
  LoanTableCompanion toTableCompanion() {
    return LoanTableCompanion(
      bookUid: d.Value(bookUid),
      userUid: d.Value(userUid),
      loanUid: d.Value(loanUid),
      loanDate: d.Value(loanDate),
      dueDate: d.Value(dueDate),
      isReturned: d.Value(isReturned),
      isExtended: d.Value(isExtended),
    );
  }

  int get remainingDays => this.dueDate.difference(DateTime.now()).inDays;
}
