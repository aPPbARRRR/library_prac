import 'package:drift/drift.dart' as d;

import '../../../feature/common/domain/model/book.dart';
import '../repository/drift_database.dart';

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

  Book bookfromTableData(BookTableData data) => Book(
      bookName: data.bookName,
      bookUid: data.bookUid,
      publishDate: data.publishDate,
      isBookLoaned: data.isBookLoaned,
      author: data.author);
}
