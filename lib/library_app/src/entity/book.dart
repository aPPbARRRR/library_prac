import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_manage_app/shared/domain/model/app_data.dart';
part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book extends AppData with _$Book {
  factory Book({
    required String bookName,
    required String bookUid,
    required String author,
    required DateTime publishDate,
    required bool isBookLoaned,
    int? loanRemainingDays,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
