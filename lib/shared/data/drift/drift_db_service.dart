// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:library_manage_app/shared/data/drift/drift_database.dart';

class LoacalDatabaseProvider extends ChangeNotifier {
  final DriftDbService driftDbService = DriftDbService();
}

class DriftDbService {
  final AppDatabase _db = AppDatabase();

  AppDatabase get driftDB => _db;

  DriftDbService._();
  static final DriftDbService driftDbService = DriftDbService._();

  factory DriftDbService() => DriftDbService._();
}
