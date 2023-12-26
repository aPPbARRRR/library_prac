import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:library_manage_app/library_app/src/data/source/csv_database_repository_impl.dart';
import 'package:library_manage_app/library_app/src/presentation/common/home_screen.dart';
import 'package:library_manage_app/library_app/src/presentation/loan/loan_view_controller.dart';
import 'package:library_manage_app/library_app/src/service/impl/user_service_impl.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    // 필요한 코드 실행(db 통신 등)

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
              child: Image.asset(
            'asset/images/logo_color_2.png',
          )),
          LinearProgressIndicator(
            color: Colors.orange[700],

          )
        ],
      )),
    );
  }
}
