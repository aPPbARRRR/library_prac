import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'book.dart';
part 'user.freezed.dart';
part 'user.g.dart'; // json_serializable 설치 확인요

@freezed
class User with _$User {
  factory User(
      {required String userUid,
      required String name,
      required String address,
      required int phoneNum,
      required DateTime birthDate,
      required DateTime registrationDate,
      @Default([]) List<Book> loaningBooks}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

