// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:library_manage_app/config/router/app_routes.dart';

import '../widget/home_screen_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('도서 대출 관리'),
          ),
          body: AppTaskButtonSection()),
    );
  }
}

class AppTaskButtonSection extends StatelessWidget {
  const AppTaskButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView(
      scrollDirection: height > width ? Axis.vertical : Axis.horizontal,
      children: const [
        HomeScreenButton(
          padding: 30,
          assetUri: 'asset/images/open-book.png',
          leadingText: '도서관리',
          contentText: '도서를 등록/삭제합니다.',
          targetScreenName: AppRoutes.resisterBook,
        ),
        HomeScreenButton(
          padding: 30,
          assetUri: 'asset/images/group.png',
          leadingText: '회원관리',
          contentText: '회원을 등록/삭제합니다.',
          targetScreenName: AppRoutes.createUser,
        ),
        HomeScreenButton(
            padding: 30,
            assetUri: 'asset/images/digital-library.png',
            leadingText: '대출관리',
            contentText: '대출/반납을 실행합니다.',
            targetScreenName: AppRoutes.loanExecute),
      ],
    );
  }
}
