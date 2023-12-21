import 'package:library_manage_app/library_app/src/data/source/drift/database.dart';
import 'package:drift/drift.dart' as d;

import 'user.dart';

extension UserExtention on User {
  UserTableCompanion toTableCompanion() {
    return UserTableCompanion(
        userUid: d.Value(this.userUid),
        name: d.Value(this.name),
        address: d.Value(this.address),
        birthDate: d.Value(this.birthDate),
        phoneNum: d.Value(this.phoneNum),
        resistrationDate: d.Value(this.registrationDate));
  }
}
