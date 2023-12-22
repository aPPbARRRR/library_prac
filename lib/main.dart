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
      // theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

// class TestApp extends StatelessWidget {
//   const TestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('asdf'),
//           leading: Icon(Icons.abc),
//           actions: [
//             Icon(Icons.access_alarm_rounded),
//             Icon(Icons.access_alarm_rounded),
//             Icon(Icons.access_alarm_rounded),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(items: [
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: 'asdf'),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: 'asdf'),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: 'asdf'),
//         ]),
//         body: MainScreen());
//   }
// }


// class MainScreen extends StatelessWidget {
//   const MainScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         DummyContents(
//             color: Colors.red, height: MediaQuery.of(context).size.height / 4),
//         DummyContents(
//             color: Colors.orange,
//             height: MediaQuery.of(context).size.height / 4),
//         DummyContents(
//             color: Colors.yellow,
//             height: MediaQuery.of(context).size.height / 4),
//         SizedBox(
//           height: 200,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//               DummyContents(
//                 color: Colors.grey,
//                 height: 150,
//               ),
//             ],
//           ),
//         ),
//         DummyContents(
//             color: Colors.yellow,
//             height: MediaQuery.of(context).size.height / 4),
//         DummyContents(
//             color: Colors.yellow,
//             height: MediaQuery.of(context).size.height / 4),
//       ],
//     );
//   }
// }

// class DummyContents extends StatelessWidget {
//   const DummyContents({
//     Key? key,
//     this.color,
//     this.height,
//     this.width,
//   }) : super(key: key);

//   final Color? color;
//   final double? height;
//   final double? width;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Column(
//           children: [
//             Expanded(child: Image.asset('asset/images/app_bar_back_image.png',)),
//             Container(height: 100, color: Colors.amber,
//             child: Row(
//               children: [
//                 CircleAvatar(backgroundColor: Colors.black,),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('상단 글제목 등', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                       Text('하단 글 정보'),
//                     ],
//                   ),
//                 )
//               ],
//             ),)
//           ],
//         )
//         ,
//         // Center(child: Text('asdfasdf')),
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: color,
//         ),
//       ),
//     );
//   }
// }


// class YouTubeSingle {

// }