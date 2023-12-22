// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:library_manage_app/library_app/src/presentation/common/home_screen.dart';

void main() {
  // 앱 시작시 스플래시 화면에서 db의 데이터 가져와 library service에 넣어주고 활용

  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
