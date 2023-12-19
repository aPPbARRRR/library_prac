// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_loan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookLoan _$BookLoanFromJson(Map<String, dynamic> json) {
  return _BookLoan.fromJson(json);
}

/// @nodoc
mixin _$BookLoan {
  String get bookName => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  DateTime get loanDate => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  int get remainingLoanDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookLoanCopyWith<BookLoan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookLoanCopyWith<$Res> {
  factory $BookLoanCopyWith(BookLoan value, $Res Function(BookLoan) then) =
      _$BookLoanCopyWithImpl<$Res, BookLoan>;
  @useResult
  $Res call(
      {String bookName,
      String userUid,
      DateTime loanDate,
      DateTime dueDate,
      int remainingLoanDays});
}

/// @nodoc
class _$BookLoanCopyWithImpl<$Res, $Val extends BookLoan>
    implements $BookLoanCopyWith<$Res> {
  _$BookLoanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? userUid = null,
    Object? loanDate = null,
    Object? dueDate = null,
    Object? remainingLoanDays = null,
  }) {
    return _then(_value.copyWith(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainingLoanDays: null == remainingLoanDays
          ? _value.remainingLoanDays
          : remainingLoanDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookLoanImplCopyWith<$Res>
    implements $BookLoanCopyWith<$Res> {
  factory _$$BookLoanImplCopyWith(
          _$BookLoanImpl value, $Res Function(_$BookLoanImpl) then) =
      __$$BookLoanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookName,
      String userUid,
      DateTime loanDate,
      DateTime dueDate,
      int remainingLoanDays});
}

/// @nodoc
class __$$BookLoanImplCopyWithImpl<$Res>
    extends _$BookLoanCopyWithImpl<$Res, _$BookLoanImpl>
    implements _$$BookLoanImplCopyWith<$Res> {
  __$$BookLoanImplCopyWithImpl(
      _$BookLoanImpl _value, $Res Function(_$BookLoanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? userUid = null,
    Object? loanDate = null,
    Object? dueDate = null,
    Object? remainingLoanDays = null,
  }) {
    return _then(_$BookLoanImpl(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainingLoanDays: null == remainingLoanDays
          ? _value.remainingLoanDays
          : remainingLoanDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookLoanImpl with DiagnosticableTreeMixin implements _BookLoan {
  _$BookLoanImpl(
      {required this.bookName,
      required this.userUid,
      required this.loanDate,
      required this.dueDate,
      required this.remainingLoanDays});

  factory _$BookLoanImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookLoanImplFromJson(json);

  @override
  final String bookName;
  @override
  final String userUid;
  @override
  final DateTime loanDate;
  @override
  final DateTime dueDate;
  @override
  final int remainingLoanDays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookLoan(bookName: $bookName, userUid: $userUid, loanDate: $loanDate, dueDate: $dueDate, remainingLoanDays: $remainingLoanDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookLoan'))
      ..add(DiagnosticsProperty('bookName', bookName))
      ..add(DiagnosticsProperty('userUid', userUid))
      ..add(DiagnosticsProperty('loanDate', loanDate))
      ..add(DiagnosticsProperty('dueDate', dueDate))
      ..add(DiagnosticsProperty('remainingLoanDays', remainingLoanDays));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookLoanImpl &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.loanDate, loanDate) ||
                other.loanDate == loanDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.remainingLoanDays, remainingLoanDays) ||
                other.remainingLoanDays == remainingLoanDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookName, userUid, loanDate, dueDate, remainingLoanDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookLoanImplCopyWith<_$BookLoanImpl> get copyWith =>
      __$$BookLoanImplCopyWithImpl<_$BookLoanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookLoanImplToJson(
      this,
    );
  }
}

abstract class _BookLoan implements BookLoan {
  factory _BookLoan(
      {required final String bookName,
      required final String userUid,
      required final DateTime loanDate,
      required final DateTime dueDate,
      required final int remainingLoanDays}) = _$BookLoanImpl;

  factory _BookLoan.fromJson(Map<String, dynamic> json) =
      _$BookLoanImpl.fromJson;

  @override
  String get bookName;
  @override
  String get userUid;
  @override
  DateTime get loanDate;
  @override
  DateTime get dueDate;
  @override
  int get remainingLoanDays;
  @override
  @JsonKey(ignore: true)
  _$$BookLoanImplCopyWith<_$BookLoanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
