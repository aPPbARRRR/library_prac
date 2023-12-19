
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
factory Book({
required   String bookName,
  required DateTime publishDate,
  required bool isBookLoaned,
  int? loanRemainingDays,
}) = _Book;
factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}