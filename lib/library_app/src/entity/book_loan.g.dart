// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookLoanImpl _$$BookLoanImplFromJson(Map<String, dynamic> json) =>
    _$BookLoanImpl(
      loanUid: json['loanUid'] as String,
      bookUid: json['bookUid'] as String,
      userUid: json['userUid'] as String,
      loanDate: DateTime.parse(json['loanDate'] as String),
      dueDate: DateTime.parse(json['dueDate'] as String),
      remainingLoanDays: json['remainingLoanDays'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookLoanImplToJson(_$BookLoanImpl instance) =>
    <String, dynamic>{
      'loanUid': instance.loanUid,
      'bookUid': instance.bookUid,
      'userUid': instance.userUid,
      'loanDate': instance.loanDate.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'remainingLoanDays': instance.remainingLoanDays,
      'user': instance.user,
      'book': instance.book,
    };
