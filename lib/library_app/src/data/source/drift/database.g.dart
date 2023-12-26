// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userUidMeta =
      const VerificationMeta('userUid');
  @override
  late final GeneratedColumn<String> userUid = GeneratedColumn<String>(
      'user_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumMeta =
      const VerificationMeta('phoneNum');
  @override
  late final GeneratedColumn<int> phoneNum = GeneratedColumn<int>(
      'phone_num', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _resistrationDateMeta =
      const VerificationMeta('resistrationDate');
  @override
  late final GeneratedColumn<DateTime> resistrationDate =
      GeneratedColumn<DateTime>('resistration_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userUid, name, address, phoneNum, birthDate, resistrationDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_uid')) {
      context.handle(_userUidMeta,
          userUid.isAcceptableOrUnknown(data['user_uid']!, _userUidMeta));
    } else if (isInserting) {
      context.missing(_userUidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('phone_num')) {
      context.handle(_phoneNumMeta,
          phoneNum.isAcceptableOrUnknown(data['phone_num']!, _phoneNumMeta));
    } else if (isInserting) {
      context.missing(_phoneNumMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('resistration_date')) {
      context.handle(
          _resistrationDateMeta,
          resistrationDate.isAcceptableOrUnknown(
              data['resistration_date']!, _resistrationDateMeta));
    } else if (isInserting) {
      context.missing(_resistrationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      userUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_uid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      phoneNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phone_num'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      resistrationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}resistration_date'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final String userUid;
  final String name;
  final String address;
  final int phoneNum;
  final DateTime birthDate;
  final DateTime resistrationDate;
  const UserTableData(
      {required this.userUid,
      required this.name,
      required this.address,
      required this.phoneNum,
      required this.birthDate,
      required this.resistrationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_uid'] = Variable<String>(userUid);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['phone_num'] = Variable<int>(phoneNum);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['resistration_date'] = Variable<DateTime>(resistrationDate);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      userUid: Value(userUid),
      name: Value(name),
      address: Value(address),
      phoneNum: Value(phoneNum),
      birthDate: Value(birthDate),
      resistrationDate: Value(resistrationDate),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      userUid: serializer.fromJson<String>(json['userUid']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      phoneNum: serializer.fromJson<int>(json['phoneNum']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      resistrationDate: serializer.fromJson<DateTime>(json['resistrationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userUid': serializer.toJson<String>(userUid),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'phoneNum': serializer.toJson<int>(phoneNum),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'resistrationDate': serializer.toJson<DateTime>(resistrationDate),
    };
  }

  UserTableData copyWith(
          {String? userUid,
          String? name,
          String? address,
          int? phoneNum,
          DateTime? birthDate,
          DateTime? resistrationDate}) =>
      UserTableData(
        userUid: userUid ?? this.userUid,
        name: name ?? this.name,
        address: address ?? this.address,
        phoneNum: phoneNum ?? this.phoneNum,
        birthDate: birthDate ?? this.birthDate,
        resistrationDate: resistrationDate ?? this.resistrationDate,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('userUid: $userUid, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('birthDate: $birthDate, ')
          ..write('resistrationDate: $resistrationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      userUid, name, address, phoneNum, birthDate, resistrationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.userUid == this.userUid &&
          other.name == this.name &&
          other.address == this.address &&
          other.phoneNum == this.phoneNum &&
          other.birthDate == this.birthDate &&
          other.resistrationDate == this.resistrationDate);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String> userUid;
  final Value<String> name;
  final Value<String> address;
  final Value<int> phoneNum;
  final Value<DateTime> birthDate;
  final Value<DateTime> resistrationDate;
  final Value<int> rowid;
  const UserTableCompanion({
    this.userUid = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.resistrationDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String userUid,
    required String name,
    required String address,
    required int phoneNum,
    required DateTime birthDate,
    required DateTime resistrationDate,
    this.rowid = const Value.absent(),
  })  : userUid = Value(userUid),
        name = Value(name),
        address = Value(address),
        phoneNum = Value(phoneNum),
        birthDate = Value(birthDate),
        resistrationDate = Value(resistrationDate);
  static Insertable<UserTableData> custom({
    Expression<String>? userUid,
    Expression<String>? name,
    Expression<String>? address,
    Expression<int>? phoneNum,
    Expression<DateTime>? birthDate,
    Expression<DateTime>? resistrationDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userUid != null) 'user_uid': userUid,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phoneNum != null) 'phone_num': phoneNum,
      if (birthDate != null) 'birth_date': birthDate,
      if (resistrationDate != null) 'resistration_date': resistrationDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserTableCompanion copyWith(
      {Value<String>? userUid,
      Value<String>? name,
      Value<String>? address,
      Value<int>? phoneNum,
      Value<DateTime>? birthDate,
      Value<DateTime>? resistrationDate,
      Value<int>? rowid}) {
    return UserTableCompanion(
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNum: phoneNum ?? this.phoneNum,
      birthDate: birthDate ?? this.birthDate,
      resistrationDate: resistrationDate ?? this.resistrationDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userUid.present) {
      map['user_uid'] = Variable<String>(userUid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phoneNum.present) {
      map['phone_num'] = Variable<int>(phoneNum.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (resistrationDate.present) {
      map['resistration_date'] = Variable<DateTime>(resistrationDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('userUid: $userUid, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('birthDate: $birthDate, ')
          ..write('resistrationDate: $resistrationDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookTableTable extends BookTable
    with TableInfo<$BookTableTable, BookTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bookUidMeta =
      const VerificationMeta('bookUid');
  @override
  late final GeneratedColumn<String> bookUid = GeneratedColumn<String>(
      'book_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookNameMeta =
      const VerificationMeta('bookName');
  @override
  late final GeneratedColumn<String> bookName = GeneratedColumn<String>(
      'book_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _publishDateMeta =
      const VerificationMeta('publishDate');
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
      'publish_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isBookLoanedMeta =
      const VerificationMeta('isBookLoaned');
  @override
  late final GeneratedColumn<bool> isBookLoaned = GeneratedColumn<bool>(
      'is_book_loaned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_book_loaned" IN (0, 1))'));
  static const VerificationMeta _loanRemainingDaysMeta =
      const VerificationMeta('loanRemainingDays');
  @override
  late final GeneratedColumn<int> loanRemainingDays = GeneratedColumn<int>(
      'loan_remaining_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [bookUid, bookName, author, publishDate, isBookLoaned, loanRemainingDays];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('book_uid')) {
      context.handle(_bookUidMeta,
          bookUid.isAcceptableOrUnknown(data['book_uid']!, _bookUidMeta));
    } else if (isInserting) {
      context.missing(_bookUidMeta);
    }
    if (data.containsKey('book_name')) {
      context.handle(_bookNameMeta,
          bookName.isAcceptableOrUnknown(data['book_name']!, _bookNameMeta));
    } else if (isInserting) {
      context.missing(_bookNameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('publish_date')) {
      context.handle(
          _publishDateMeta,
          publishDate.isAcceptableOrUnknown(
              data['publish_date']!, _publishDateMeta));
    } else if (isInserting) {
      context.missing(_publishDateMeta);
    }
    if (data.containsKey('is_book_loaned')) {
      context.handle(
          _isBookLoanedMeta,
          isBookLoaned.isAcceptableOrUnknown(
              data['is_book_loaned']!, _isBookLoanedMeta));
    } else if (isInserting) {
      context.missing(_isBookLoanedMeta);
    }
    if (data.containsKey('loan_remaining_days')) {
      context.handle(
          _loanRemainingDaysMeta,
          loanRemainingDays.isAcceptableOrUnknown(
              data['loan_remaining_days']!, _loanRemainingDaysMeta));
    } else if (isInserting) {
      context.missing(_loanRemainingDaysMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BookTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookTableData(
      bookUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_uid'])!,
      bookName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_name'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      publishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}publish_date'])!,
      isBookLoaned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_book_loaned'])!,
      loanRemainingDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}loan_remaining_days'])!,
    );
  }

  @override
  $BookTableTable createAlias(String alias) {
    return $BookTableTable(attachedDatabase, alias);
  }
}

class BookTableData extends DataClass implements Insertable<BookTableData> {
  final String bookUid;
  final String bookName;
  final String author;
  final DateTime publishDate;
  final bool isBookLoaned;
  final int loanRemainingDays;
  const BookTableData(
      {required this.bookUid,
      required this.bookName,
      required this.author,
      required this.publishDate,
      required this.isBookLoaned,
      required this.loanRemainingDays});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['book_uid'] = Variable<String>(bookUid);
    map['book_name'] = Variable<String>(bookName);
    map['author'] = Variable<String>(author);
    map['publish_date'] = Variable<DateTime>(publishDate);
    map['is_book_loaned'] = Variable<bool>(isBookLoaned);
    map['loan_remaining_days'] = Variable<int>(loanRemainingDays);
    return map;
  }

  BookTableCompanion toCompanion(bool nullToAbsent) {
    return BookTableCompanion(
      bookUid: Value(bookUid),
      bookName: Value(bookName),
      author: Value(author),
      publishDate: Value(publishDate),
      isBookLoaned: Value(isBookLoaned),
      loanRemainingDays: Value(loanRemainingDays),
    );
  }

  factory BookTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookTableData(
      bookUid: serializer.fromJson<String>(json['bookUid']),
      bookName: serializer.fromJson<String>(json['bookName']),
      author: serializer.fromJson<String>(json['author']),
      publishDate: serializer.fromJson<DateTime>(json['publishDate']),
      isBookLoaned: serializer.fromJson<bool>(json['isBookLoaned']),
      loanRemainingDays: serializer.fromJson<int>(json['loanRemainingDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bookUid': serializer.toJson<String>(bookUid),
      'bookName': serializer.toJson<String>(bookName),
      'author': serializer.toJson<String>(author),
      'publishDate': serializer.toJson<DateTime>(publishDate),
      'isBookLoaned': serializer.toJson<bool>(isBookLoaned),
      'loanRemainingDays': serializer.toJson<int>(loanRemainingDays),
    };
  }

  BookTableData copyWith(
          {String? bookUid,
          String? bookName,
          String? author,
          DateTime? publishDate,
          bool? isBookLoaned,
          int? loanRemainingDays}) =>
      BookTableData(
        bookUid: bookUid ?? this.bookUid,
        bookName: bookName ?? this.bookName,
        author: author ?? this.author,
        publishDate: publishDate ?? this.publishDate,
        isBookLoaned: isBookLoaned ?? this.isBookLoaned,
        loanRemainingDays: loanRemainingDays ?? this.loanRemainingDays,
      );
  @override
  String toString() {
    return (StringBuffer('BookTableData(')
          ..write('bookUid: $bookUid, ')
          ..write('bookName: $bookName, ')
          ..write('author: $author, ')
          ..write('publishDate: $publishDate, ')
          ..write('isBookLoaned: $isBookLoaned, ')
          ..write('loanRemainingDays: $loanRemainingDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      bookUid, bookName, author, publishDate, isBookLoaned, loanRemainingDays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookTableData &&
          other.bookUid == this.bookUid &&
          other.bookName == this.bookName &&
          other.author == this.author &&
          other.publishDate == this.publishDate &&
          other.isBookLoaned == this.isBookLoaned &&
          other.loanRemainingDays == this.loanRemainingDays);
}

class BookTableCompanion extends UpdateCompanion<BookTableData> {
  final Value<String> bookUid;
  final Value<String> bookName;
  final Value<String> author;
  final Value<DateTime> publishDate;
  final Value<bool> isBookLoaned;
  final Value<int> loanRemainingDays;
  final Value<int> rowid;
  const BookTableCompanion({
    this.bookUid = const Value.absent(),
    this.bookName = const Value.absent(),
    this.author = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.isBookLoaned = const Value.absent(),
    this.loanRemainingDays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookTableCompanion.insert({
    required String bookUid,
    required String bookName,
    required String author,
    required DateTime publishDate,
    required bool isBookLoaned,
    required int loanRemainingDays,
    this.rowid = const Value.absent(),
  })  : bookUid = Value(bookUid),
        bookName = Value(bookName),
        author = Value(author),
        publishDate = Value(publishDate),
        isBookLoaned = Value(isBookLoaned),
        loanRemainingDays = Value(loanRemainingDays);
  static Insertable<BookTableData> custom({
    Expression<String>? bookUid,
    Expression<String>? bookName,
    Expression<String>? author,
    Expression<DateTime>? publishDate,
    Expression<bool>? isBookLoaned,
    Expression<int>? loanRemainingDays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bookUid != null) 'book_uid': bookUid,
      if (bookName != null) 'book_name': bookName,
      if (author != null) 'author': author,
      if (publishDate != null) 'publish_date': publishDate,
      if (isBookLoaned != null) 'is_book_loaned': isBookLoaned,
      if (loanRemainingDays != null) 'loan_remaining_days': loanRemainingDays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookTableCompanion copyWith(
      {Value<String>? bookUid,
      Value<String>? bookName,
      Value<String>? author,
      Value<DateTime>? publishDate,
      Value<bool>? isBookLoaned,
      Value<int>? loanRemainingDays,
      Value<int>? rowid}) {
    return BookTableCompanion(
      bookUid: bookUid ?? this.bookUid,
      bookName: bookName ?? this.bookName,
      author: author ?? this.author,
      publishDate: publishDate ?? this.publishDate,
      isBookLoaned: isBookLoaned ?? this.isBookLoaned,
      loanRemainingDays: loanRemainingDays ?? this.loanRemainingDays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bookUid.present) {
      map['book_uid'] = Variable<String>(bookUid.value);
    }
    if (bookName.present) {
      map['book_name'] = Variable<String>(bookName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (isBookLoaned.present) {
      map['is_book_loaned'] = Variable<bool>(isBookLoaned.value);
    }
    if (loanRemainingDays.present) {
      map['loan_remaining_days'] = Variable<int>(loanRemainingDays.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookTableCompanion(')
          ..write('bookUid: $bookUid, ')
          ..write('bookName: $bookName, ')
          ..write('author: $author, ')
          ..write('publishDate: $publishDate, ')
          ..write('isBookLoaned: $isBookLoaned, ')
          ..write('loanRemainingDays: $loanRemainingDays, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoanTableTable extends LoanTable
    with TableInfo<$LoanTableTable, LoanTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _loanUidMeta =
      const VerificationMeta('loanUid');
  @override
  late final GeneratedColumn<String> loanUid = GeneratedColumn<String>(
      'loan_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bookUidMeta =
      const VerificationMeta('bookUid');
  @override
  late final GeneratedColumn<String> bookUid = GeneratedColumn<String>(
      'book_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userUidMeta =
      const VerificationMeta('userUid');
  @override
  late final GeneratedColumn<String> userUid = GeneratedColumn<String>(
      'user_uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanDateMeta =
      const VerificationMeta('loanDate');
  @override
  late final GeneratedColumn<DateTime> loanDate = GeneratedColumn<DateTime>(
      'loan_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReturnedMeta =
      const VerificationMeta('isReturned');
  @override
  late final GeneratedColumn<bool> isReturned = GeneratedColumn<bool>(
      'is_returned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_returned" IN (0, 1))'));
  static const VerificationMeta _isExtendedMeta =
      const VerificationMeta('isExtended');
  @override
  late final GeneratedColumn<bool> isExtended = GeneratedColumn<bool>(
      'is_extended', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_extended" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [loanUid, bookUid, userUid, loanDate, dueDate, isReturned, isExtended];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_table';
  @override
  VerificationContext validateIntegrity(Insertable<LoanTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('loan_uid')) {
      context.handle(_loanUidMeta,
          loanUid.isAcceptableOrUnknown(data['loan_uid']!, _loanUidMeta));
    } else if (isInserting) {
      context.missing(_loanUidMeta);
    }
    if (data.containsKey('book_uid')) {
      context.handle(_bookUidMeta,
          bookUid.isAcceptableOrUnknown(data['book_uid']!, _bookUidMeta));
    } else if (isInserting) {
      context.missing(_bookUidMeta);
    }
    if (data.containsKey('user_uid')) {
      context.handle(_userUidMeta,
          userUid.isAcceptableOrUnknown(data['user_uid']!, _userUidMeta));
    } else if (isInserting) {
      context.missing(_userUidMeta);
    }
    if (data.containsKey('loan_date')) {
      context.handle(_loanDateMeta,
          loanDate.isAcceptableOrUnknown(data['loan_date']!, _loanDateMeta));
    } else if (isInserting) {
      context.missing(_loanDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('is_returned')) {
      context.handle(
          _isReturnedMeta,
          isReturned.isAcceptableOrUnknown(
              data['is_returned']!, _isReturnedMeta));
    } else if (isInserting) {
      context.missing(_isReturnedMeta);
    }
    if (data.containsKey('is_extended')) {
      context.handle(
          _isExtendedMeta,
          isExtended.isAcceptableOrUnknown(
              data['is_extended']!, _isExtendedMeta));
    } else if (isInserting) {
      context.missing(_isExtendedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LoanTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanTableData(
      loanUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loan_uid'])!,
      bookUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}book_uid'])!,
      userUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_uid'])!,
      loanDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}loan_date'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date'])!,
      isReturned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_returned'])!,
      isExtended: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_extended'])!,
    );
  }

  @override
  $LoanTableTable createAlias(String alias) {
    return $LoanTableTable(attachedDatabase, alias);
  }
}

class LoanTableData extends DataClass implements Insertable<LoanTableData> {
  final String loanUid;
  final String bookUid;
  final String userUid;
  final DateTime loanDate;
  final DateTime dueDate;
  final bool isReturned;
  final bool isExtended;
  const LoanTableData(
      {required this.loanUid,
      required this.bookUid,
      required this.userUid,
      required this.loanDate,
      required this.dueDate,
      required this.isReturned,
      required this.isExtended});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['loan_uid'] = Variable<String>(loanUid);
    map['book_uid'] = Variable<String>(bookUid);
    map['user_uid'] = Variable<String>(userUid);
    map['loan_date'] = Variable<DateTime>(loanDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['is_returned'] = Variable<bool>(isReturned);
    map['is_extended'] = Variable<bool>(isExtended);
    return map;
  }

  LoanTableCompanion toCompanion(bool nullToAbsent) {
    return LoanTableCompanion(
      loanUid: Value(loanUid),
      bookUid: Value(bookUid),
      userUid: Value(userUid),
      loanDate: Value(loanDate),
      dueDate: Value(dueDate),
      isReturned: Value(isReturned),
      isExtended: Value(isExtended),
    );
  }

  factory LoanTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanTableData(
      loanUid: serializer.fromJson<String>(json['loanUid']),
      bookUid: serializer.fromJson<String>(json['bookUid']),
      userUid: serializer.fromJson<String>(json['userUid']),
      loanDate: serializer.fromJson<DateTime>(json['loanDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      isReturned: serializer.fromJson<bool>(json['isReturned']),
      isExtended: serializer.fromJson<bool>(json['isExtended']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'loanUid': serializer.toJson<String>(loanUid),
      'bookUid': serializer.toJson<String>(bookUid),
      'userUid': serializer.toJson<String>(userUid),
      'loanDate': serializer.toJson<DateTime>(loanDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'isReturned': serializer.toJson<bool>(isReturned),
      'isExtended': serializer.toJson<bool>(isExtended),
    };
  }

  LoanTableData copyWith(
          {String? loanUid,
          String? bookUid,
          String? userUid,
          DateTime? loanDate,
          DateTime? dueDate,
          bool? isReturned,
          bool? isExtended}) =>
      LoanTableData(
        loanUid: loanUid ?? this.loanUid,
        bookUid: bookUid ?? this.bookUid,
        userUid: userUid ?? this.userUid,
        loanDate: loanDate ?? this.loanDate,
        dueDate: dueDate ?? this.dueDate,
        isReturned: isReturned ?? this.isReturned,
        isExtended: isExtended ?? this.isExtended,
      );
  @override
  String toString() {
    return (StringBuffer('LoanTableData(')
          ..write('loanUid: $loanUid, ')
          ..write('bookUid: $bookUid, ')
          ..write('userUid: $userUid, ')
          ..write('loanDate: $loanDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('isReturned: $isReturned, ')
          ..write('isExtended: $isExtended')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      loanUid, bookUid, userUid, loanDate, dueDate, isReturned, isExtended);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanTableData &&
          other.loanUid == this.loanUid &&
          other.bookUid == this.bookUid &&
          other.userUid == this.userUid &&
          other.loanDate == this.loanDate &&
          other.dueDate == this.dueDate &&
          other.isReturned == this.isReturned &&
          other.isExtended == this.isExtended);
}

class LoanTableCompanion extends UpdateCompanion<LoanTableData> {
  final Value<String> loanUid;
  final Value<String> bookUid;
  final Value<String> userUid;
  final Value<DateTime> loanDate;
  final Value<DateTime> dueDate;
  final Value<bool> isReturned;
  final Value<bool> isExtended;
  final Value<int> rowid;
  const LoanTableCompanion({
    this.loanUid = const Value.absent(),
    this.bookUid = const Value.absent(),
    this.userUid = const Value.absent(),
    this.loanDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isReturned = const Value.absent(),
    this.isExtended = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoanTableCompanion.insert({
    required String loanUid,
    required String bookUid,
    required String userUid,
    required DateTime loanDate,
    required DateTime dueDate,
    required bool isReturned,
    required bool isExtended,
    this.rowid = const Value.absent(),
  })  : loanUid = Value(loanUid),
        bookUid = Value(bookUid),
        userUid = Value(userUid),
        loanDate = Value(loanDate),
        dueDate = Value(dueDate),
        isReturned = Value(isReturned),
        isExtended = Value(isExtended);
  static Insertable<LoanTableData> custom({
    Expression<String>? loanUid,
    Expression<String>? bookUid,
    Expression<String>? userUid,
    Expression<DateTime>? loanDate,
    Expression<DateTime>? dueDate,
    Expression<bool>? isReturned,
    Expression<bool>? isExtended,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (loanUid != null) 'loan_uid': loanUid,
      if (bookUid != null) 'book_uid': bookUid,
      if (userUid != null) 'user_uid': userUid,
      if (loanDate != null) 'loan_date': loanDate,
      if (dueDate != null) 'due_date': dueDate,
      if (isReturned != null) 'is_returned': isReturned,
      if (isExtended != null) 'is_extended': isExtended,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoanTableCompanion copyWith(
      {Value<String>? loanUid,
      Value<String>? bookUid,
      Value<String>? userUid,
      Value<DateTime>? loanDate,
      Value<DateTime>? dueDate,
      Value<bool>? isReturned,
      Value<bool>? isExtended,
      Value<int>? rowid}) {
    return LoanTableCompanion(
      loanUid: loanUid ?? this.loanUid,
      bookUid: bookUid ?? this.bookUid,
      userUid: userUid ?? this.userUid,
      loanDate: loanDate ?? this.loanDate,
      dueDate: dueDate ?? this.dueDate,
      isReturned: isReturned ?? this.isReturned,
      isExtended: isExtended ?? this.isExtended,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (loanUid.present) {
      map['loan_uid'] = Variable<String>(loanUid.value);
    }
    if (bookUid.present) {
      map['book_uid'] = Variable<String>(bookUid.value);
    }
    if (userUid.present) {
      map['user_uid'] = Variable<String>(userUid.value);
    }
    if (loanDate.present) {
      map['loan_date'] = Variable<DateTime>(loanDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isReturned.present) {
      map['is_returned'] = Variable<bool>(isReturned.value);
    }
    if (isExtended.present) {
      map['is_extended'] = Variable<bool>(isExtended.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanTableCompanion(')
          ..write('loanUid: $loanUid, ')
          ..write('bookUid: $bookUid, ')
          ..write('userUid: $userUid, ')
          ..write('loanDate: $loanDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('isReturned: $isReturned, ')
          ..write('isExtended: $isExtended, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $BookTableTable bookTable = $BookTableTable(this);
  late final $LoanTableTable loanTable = $LoanTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, bookTable, loanTable];
}
