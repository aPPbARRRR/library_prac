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
  String get loanUid => throw _privateConstructorUsedError;
  String get bookUid => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  DateTime get loanDate => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  int get remainingLoanDays => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Book get book => throw _privateConstructorUsedError;

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
      {String loanUid,
      String bookUid,
      String userUid,
      DateTime loanDate,
      DateTime dueDate,
      int remainingLoanDays,
      User user,
      Book book});

  $UserCopyWith<$Res> get user;
  $BookCopyWith<$Res> get book;
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
    Object? loanUid = null,
    Object? bookUid = null,
    Object? userUid = null,
    Object? loanDate = null,
    Object? dueDate = null,
    Object? remainingLoanDays = null,
    Object? user = null,
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      loanUid: null == loanUid
          ? _value.loanUid
          : loanUid // ignore: cast_nullable_to_non_nullable
              as String,
      bookUid: null == bookUid
          ? _value.bookUid
          : bookUid // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
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
      {String loanUid,
      String bookUid,
      String userUid,
      DateTime loanDate,
      DateTime dueDate,
      int remainingLoanDays,
      User user,
      Book book});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $BookCopyWith<$Res> get book;
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
    Object? loanUid = null,
    Object? bookUid = null,
    Object? userUid = null,
    Object? loanDate = null,
    Object? dueDate = null,
    Object? remainingLoanDays = null,
    Object? user = null,
    Object? book = null,
  }) {
    return _then(_$BookLoanImpl(
      loanUid: null == loanUid
          ? _value.loanUid
          : loanUid // ignore: cast_nullable_to_non_nullable
              as String,
      bookUid: null == bookUid
          ? _value.bookUid
          : bookUid // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookLoanImpl with DiagnosticableTreeMixin implements _BookLoan {
  _$BookLoanImpl(
      {required this.loanUid,
      required this.bookUid,
      required this.userUid,
      required this.loanDate,
      required this.dueDate,
      required this.remainingLoanDays,
      required this.user,
      required this.book});

  factory _$BookLoanImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookLoanImplFromJson(json);

  @override
  final String loanUid;
  @override
  final String bookUid;
  @override
  final String userUid;
  @override
  final DateTime loanDate;
  @override
  final DateTime dueDate;
  @override
  final int remainingLoanDays;
  @override
  final User user;
  @override
  final Book book;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookLoan(loanUid: $loanUid, bookUid: $bookUid, userUid: $userUid, loanDate: $loanDate, dueDate: $dueDate, remainingLoanDays: $remainingLoanDays, user: $user, book: $book)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookLoan'))
      ..add(DiagnosticsProperty('loanUid', loanUid))
      ..add(DiagnosticsProperty('bookUid', bookUid))
      ..add(DiagnosticsProperty('userUid', userUid))
      ..add(DiagnosticsProperty('loanDate', loanDate))
      ..add(DiagnosticsProperty('dueDate', dueDate))
      ..add(DiagnosticsProperty('remainingLoanDays', remainingLoanDays))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('book', book));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookLoanImpl &&
            (identical(other.loanUid, loanUid) || other.loanUid == loanUid) &&
            (identical(other.bookUid, bookUid) || other.bookUid == bookUid) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.loanDate, loanDate) ||
                other.loanDate == loanDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.remainingLoanDays, remainingLoanDays) ||
                other.remainingLoanDays == remainingLoanDays) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.book, book) || other.book == book));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loanUid, bookUid, userUid,
      loanDate, dueDate, remainingLoanDays, user, book);

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
      {required final String loanUid,
      required final String bookUid,
      required final String userUid,
      required final DateTime loanDate,
      required final DateTime dueDate,
      required final int remainingLoanDays,
      required final User user,
      required final Book book}) = _$BookLoanImpl;

  factory _BookLoan.fromJson(Map<String, dynamic> json) =
      _$BookLoanImpl.fromJson;

  @override
  String get loanUid;
  @override
  String get bookUid;
  @override
  String get userUid;
  @override
  DateTime get loanDate;
  @override
  DateTime get dueDate;
  @override
  int get remainingLoanDays;
  @override
  User get user;
  @override
  Book get book;
  @override
  @JsonKey(ignore: true)
  _$$BookLoanImplCopyWith<_$BookLoanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
