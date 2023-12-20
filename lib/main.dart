import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/presentation/common/home_screen.dart';

void main() {
  // 앱 시작시 스플래시 화면에서 db의 데이터 가져와 library service에 넣어주고 활용
  // library service의 데이터를 활용하여 모든 task 수행
  // db에 crud 하는 시점은 백업이 수행되는 시점임. 항상 통으로 백업 진행.
  // 앱 성능 봐서 결정 -> 모든 task 수행시 백업을 진행 || 요청시에만 백업을 진행

<<<<<<< HEAD
  runApp(const LibraryApp());
=======

  runApp(const MyApp());
>>>>>>> main
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeScreen(),
    );
  }
}
