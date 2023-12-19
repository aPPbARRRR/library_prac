// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get bookName => throw _privateConstructorUsedError;
  DateTime get publishDate => throw _privateConstructorUsedError;
  bool get isBookLoaned => throw _privateConstructorUsedError;
  int? get loanRemainingDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String bookName,
      DateTime publishDate,
      bool isBookLoaned,
      int? loanRemainingDays});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? publishDate = null,
    Object? isBookLoaned = null,
    Object? loanRemainingDays = freezed,
  }) {
    return _then(_value.copyWith(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isBookLoaned: null == isBookLoaned
          ? _value.isBookLoaned
          : isBookLoaned // ignore: cast_nullable_to_non_nullable
              as bool,
      loanRemainingDays: freezed == loanRemainingDays
          ? _value.loanRemainingDays
          : loanRemainingDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookName,
      DateTime publishDate,
      bool isBookLoaned,
      int? loanRemainingDays});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? publishDate = null,
    Object? isBookLoaned = null,
    Object? loanRemainingDays = freezed,
  }) {
    return _then(_$BookImpl(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isBookLoaned: null == isBookLoaned
          ? _value.isBookLoaned
          : isBookLoaned // ignore: cast_nullable_to_non_nullable
              as bool,
      loanRemainingDays: freezed == loanRemainingDays
          ? _value.loanRemainingDays
          : loanRemainingDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  _$BookImpl(
      {required this.bookName,
      required this.publishDate,
      required this.isBookLoaned,
      this.loanRemainingDays});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String bookName;
  @override
  final DateTime publishDate;
  @override
  final bool isBookLoaned;
  @override
  final int? loanRemainingDays;

  @override
  String toString() {
    return 'Book(bookName: $bookName, publishDate: $publishDate, isBookLoaned: $isBookLoaned, loanRemainingDays: $loanRemainingDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.isBookLoaned, isBookLoaned) ||
                other.isBookLoaned == isBookLoaned) &&
            (identical(other.loanRemainingDays, loanRemainingDays) ||
                other.loanRemainingDays == loanRemainingDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookName, publishDate, isBookLoaned, loanRemainingDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required final String bookName,
      required final DateTime publishDate,
      required final bool isBookLoaned,
      final int? loanRemainingDays}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String get bookName;
  @override
  DateTime get publishDate;
  @override
  bool get isBookLoaned;
  @override
  int? get loanRemainingDays;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
