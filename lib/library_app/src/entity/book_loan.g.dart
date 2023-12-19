// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookLoanImpl _$$BookLoanImplFromJson(Map<String, dynamic> json) =>
    _$BookLoanImpl(
      bookName: json['bookName'] as String,
      userUid: json['userUid'] as String,
      loanDate: DateTime.parse(json['loanDate'] as String),
      dueDate: DateTime.parse(json['dueDate'] as String),
      remainingLoanDays: json['remainingLoanDays'] as int,
    );

Map<String, dynamic> _$$BookLoanImplToJson(_$BookLoanImpl instance) =>
    <String, dynamic>{
      'bookName': instance.bookName,
      'userUid': instance.userUid,
      'loanDate': instance.loanDate.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'remainingLoanDays': instance.remainingLoanDays,
    };
