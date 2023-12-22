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
      // theme: ThemeData.dark(),
      home:HomeScreen(),
    );
  }
}




class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdf'),
         leading: Icon(Icons.abc),
         actions: [
          Icon(Icons.access_alarm_rounded),
          Icon(Icons.access_alarm_rounded),
          Icon(Icons.access_alarm_rounded),
         ],
      ),

      body: ListView(
        children: [
          DummyContents(),
          DummyContents(),DummyContents(),
          DummyContents(),
          DummyContents(),
        ],
      )
    );
  }
}

class DummyContents extends StatelessWidget {
  const DummyContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(child: Text('asdfasdf')),
        height: MediaQuery.of(context).size.height/4,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }
}