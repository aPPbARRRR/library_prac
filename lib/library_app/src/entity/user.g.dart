// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userUid: json['userUid'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNum: json['phoneNum'] as int,
      birthDate: DateTime.parse(json['birthDate'] as String),
      registrationDate: DateTime.parse(json['registrationDate'] as String),
      loaningBooks: (json['loaningBooks'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'name': instance.name,
      'address': instance.address,
      'phoneNum': instance.phoneNum,
      'birthDate': instance.birthDate.toIso8601String(),
      'registrationDate': instance.registrationDate.toIso8601String(),
      'loaningBooks': instance.loaningBooks,
    };
