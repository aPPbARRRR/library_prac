import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'book.dart';
import 'user.dart';
part 'book_loan.freezed.dart';
part 'book_loan.g.dart'; // json_serializable 설치 확인요
@freezed
class BookLoan with _$BookLoan {
factory BookLoan({
required String loanUid,
required String bookUid,
required String userUid,
required DateTime loanDate,
required DateTime dueDate,
required int remainingLoanDays,
required User user,
required Book book,
}) = _BookLoan;
factory BookLoan.fromJson(Map<String, dynamic> json) => _$BookLoanFromJson(json);
}