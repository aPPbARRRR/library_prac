import 'package:drift/drift.dart' as d;
import 'package:library_manage_app/shared/data/drift/drift_database.dart';

import 'book.dart';

extension BookExtention on Book {
  BookTableCompanion toTableCompanion() {
    return BookTableCompanion(
        bookName: d.Value(this.bookName),
        bookUid: d.Value(this.bookUid),
        publishDate: d.Value(this.publishDate),
        isBookLoaned: d.Value(this.isBookLoaned),
        loanRemainingDays: d.Value(this.loanRemainingDays ?? -1),
        author: d.Value(this.author));
  }
}
