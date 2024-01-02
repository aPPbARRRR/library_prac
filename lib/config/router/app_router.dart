import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/book/data/repository_impl/book_service_impl.dart';
import 'package:library_manage_app/feature/book/presentation/view/screen/book_manage_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/screen/home_screen.dart';
import 'package:library_manage_app/feature/common/presentation/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import '../../feature/book/presentation/view/screen/book_single_view.dart';
import '../../feature/book/presentation/view/screen/resister_book_screen.dart';
import '../../library_app/src/presentation/common/search_screen.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: '/splash',
    redirect: (BuildContext context, GoRouterState state) async {
      print('redirection ${state.name}');
    },
    routes: [
      GoRoute(
          path: '/splash',
          name: AppRoutes.splash,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          }),
      GoRoute(
          path: '/home',
          name: AppRoutes.home,
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
          routes: [
            // StatefulShellRoute.indexedStack(
            //   builder: (BuildContext context, GoRouterState state,
            //       StatefulNavigationShell navigationShell) {
            //     return ScaffoldWithNavBar(navigationShell: navigationShell);
            //   },
            //   branches: <StatefulShellBranch>[
            //     StatefulShellBranch(
            //       routes: [
            //         GoRoute(
            //           path: 'resisterBook',
            //           name: AppRoutes.resisterBook,
            //           builder: (BuildContext context, GoRouterState state) =>
            //               ResisterBookScreen(),
            //         )
            //       ],
            //     ),
            //     StatefulShellBranch(
            //       routes: [
            //         GoRoute(
            //           path: 'search',
            //           name: AppRoutes.search,
            //           builder: (BuildContext context, GoRouterState state) =>
            //               SearchScreen(
            //             searchType: SearchType.book,
            //             onTileTapped: (book) {
            //               // 유저 상세 페이지로 이동(회원관리 / 회원검색 / 회원타일 에 한해서 onTileTapped가 그렇게 작동하는 것임.)
            //               Navigator.of(context).push(MaterialPageRoute(
            //                   builder: (context) => BookSingleView()));
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            GoRoute(
                path: 'bookmanagescreen',
                name: AppRoutes.bookManage,
                builder: (context, state) => BookManageScreen()),
            GoRoute(
                path: 'bookSingleView',
                name: AppRoutes.bookSingle,
                builder: (context, state) => BookSingleView())
          ])
    ]);
