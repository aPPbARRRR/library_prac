import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // 간단한 로직이므로 view에서 실행
    Future.delayed(Duration(milliseconds: 1500))
        .then((value) => context.goNamed(AppRoutes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
