import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../../../feature/common/domain/model/book.dart';
import '../../../feature/common/domain/model/user.dart';

part 'drift_database.g.dart';

class UserTable extends Table {
  TextColumn get userUid => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  IntColumn get phoneNum => integer()();
  DateTimeColumn get birthDate => dateTime()();
  DateTimeColumn get resistrationDate => dateTime()();
}

class BookTable extends Table {
  TextColumn get bookUid => text()();
  TextColumn get bookName => text()();
  TextColumn get author => text()();
  DateTimeColumn get publishDate => dateTime()();
  BoolColumn get isBookLoaned => boolean()();
  IntColumn get loanRemainingDays => integer()();
}

class LoanTable extends Table {
  TextColumn get loanUid => text()();
  TextColumn get bookUid => text()();
  TextColumn get userUid => text()();
  DateTimeColumn get loanDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  BoolColumn get isReturned => boolean()();
  BoolColumn get isExtended => boolean()();
}

@DriftDatabase(tables: [UserTable, BookTable, LoanTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Book tableDataToBook(BookTableData data) => Book(
      bookName: data.bookName,
      bookUid: data.bookUid,
      publishDate: data.publishDate,
      isBookLoaned: data.isBookLoaned,
      author: data.author);

  User tableDataToUser(UserTableData user) => User(
      userUid: user.userUid,
      name: user.name,
      address: user.address,
      phoneNum: user.phoneNum,
      birthDate: user.birthDate,
      registrationDate: DateTime.now());

  // 유저 생성
  // Future createUser(UserTableCompanion user) => into(userTable).insert(user);

  // // 유저 삭제
  // Future removeUser(UserTableCompanion user) => (delete(userTable)..where((tbl) => tbl.userUid.equals(user.userUid.value))).go();
  // Future getUser(String userUid) =>  (select(userTable)..where((tbl) => tbl.userUid.equals(userUid))).get();
  Future getAllBooks(String bookUid) =>
      (select(bookTable)..where((tbl) => tbl.bookUid.equals(bookUid))).get();
  // Future getLoan(String loanUid) =>  (select(loanTable)..where((tbl) => tbl.loanUid.equals(loanUid))).get();
  //  Future selectAllUsers() => select(this.userTable).get();
  //  Future selectAllBooks() => select(this.bookTable).get();
  //  Future selectAllLoans() => select(this.loanTable).get();

  //  Stream<List<TodoItem>> watchEntriesInCategory(Category c) {
  //   return (select(todos)..where((t) => t.category.equals(c.id))).watch();
  // }

  //   Future createSchedule(ScheduleCompanion data) => into(schedule).insert(data); // 스케줄 만들기
  // Future selectSchedule() => select(schedule).get(); // 스케줄 가져오기
  // Future selectMonthSchedule(int month, String uid) => // 선택한 월 스케줄 가져오기
  //     (select(schedule)
  //     ..where((tbl) => tbl.month.equals(month))
  //     ..where((tbl) => tbl.userUid.equals(uid))
  //     ).get();
  // Future deleteAll() => delete(schedule).go(); // 전체 스케줄 삭제
  // Future deleteSchedule(int id) => // 선택한 id의 단일 스케줄 가져오기
  //     (delete(schedule)..where((tbl) => tbl.id.equals(id))).go();
  // Future updateSchedule(int id, ScheduleCompanion data) => // 업데이트
  //     (update(schedule)..where((tbl) => tbl.id.equals(id))).write(data);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
