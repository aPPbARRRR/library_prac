// extension BookExtention on Book {
//   BookTableCompanion toTableCompanion() {
//     return BookTableCompanion(
//       bookName: d.Value(this.bookName),
//       bookUid: d.Value(this.bookUid),
//       publishDate: d.Value(this.publishDate),
//       isBookLoaned: d.Value(this.isBookLoaned),
//       loanRemainingDays: d.Value(this.loanRemainingDays??-1)
//     );
//   }
// }
import 'package:drift/drift.dart' as d;

import 'package:library_manage_app/library_app/src/data/source/drift/database.dart';
import 'package:library_manage_app/library_app/src/entity/book_loan.dart';

extension BookLoanExtention on BookLoan {
  LoanTableCompanion toTableCompanion(){
    return LoanTableCompanion(
      bookUid: d.Value(bookUid),
      userUid: d.Value(userUid),
      loanUid: d.Value(loanUid),
      loanDate: d.Value(loanDate),
      dueDate: d.Value(dueDate)
    );
  }

  int get remainingDays => this.dueDate.difference(DateTime.now()).inDays;
}