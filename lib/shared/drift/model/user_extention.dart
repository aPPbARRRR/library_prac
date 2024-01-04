import 'package:drift/drift.dart' as d;

import '../../../feature/common/domain/model/user.dart';
import '../repository/drift_database.dart';

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
