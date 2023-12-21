import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_manage_app/library_app/src/data/source/drift_db_repository_impl.dart';

void main () {



WidgetsFlutterBinding.ensureInitialized();
  test('getUsers test ok', () async {
      DriftDBRepositoryImpl repositoryImpl =DriftDBRepositoryImpl();
    expect(await repositoryImpl.getUsers(), 1);
  });
}