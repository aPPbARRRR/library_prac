// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/router/app_router.dart';
import 'shared/data/drift/drift_db_service.dart';

void main() {
  // 앱 시작시 스플래시 화면에서 db의 데이터 가져와 library service에 넣어주고 활용

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoacalDatabaseProvider>(
          create: (cntxt) => LoacalDatabaseProvider()),
    ],
    child: const LibraryApp(),
  ));
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      routerConfig: appRouter,
    );
  }
}
