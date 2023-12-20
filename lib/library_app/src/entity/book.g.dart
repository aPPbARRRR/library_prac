// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      bookName: json['bookName'] as String,
      bookUid: json['bookUid'] as String,
      publishDate: DateTime.parse(json['publishDate'] as String),
      isBookLoaned: json['isBookLoaned'] as bool,
      loanRemainingDays: json['loanRemainingDays'] as int?,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'bookName': instance.bookName,
      'bookUid': instance.bookUid,
      'publishDate': instance.publishDate.toIso8601String(),
      'isBookLoaned': instance.isBookLoaned,
      'loanRemainingDays': instance.loanRemainingDays,
    };
