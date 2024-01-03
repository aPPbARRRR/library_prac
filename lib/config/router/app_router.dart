import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/book/data/repository_impl/book_service_impl.dart';
import 'package:library_manage_app/feature/book/presentation/view/screen/book_manage_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/screen/home_screen.dart';
import 'package:library_manage_app/feature/common/presentation/screen/splash_screen.dart';
import 'package:library_manage_app/feature/common/presentation/view_model/search_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../feature/book/presentation/view/screen/resister_book_screen.dart';
import '../../feature/book/presentation/view_model/book_single_view_model.dart';
import '../../feature/common/domain/model/search_type.dart';
import '../../feature/common/presentation/screen/search_screen.dart';

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
          builder: (BuildContext context, GoRouterState state) =>
              ChangeNotifierProvider(
                create: (cntxt) => BookSingViewModel(),
                child: HomeScreen(),
              ),
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ChangeNotifierProvider(
                  create: (cntxt) => BookServiceProvider(),
                  child: BookManageScreen(navigationShell: navigationShell),
                );
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'resisterBook',
                        name: AppRoutes.resisterBook,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => ResisterBookScreenViewModel(
                                  bookService: context
                                      .watch<BookServiceProvider>()
                                      .bookService),
                              child: ResisterBookScreen(),
                            ))
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'search',
                        name: AppRoutes.search,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => SearchScreenViewModel(
                                searchType: SearchType.book,
                              ),
                              child: SearchScreen(),
                            )),
                  ],
                ),
              ],
            ),
          ])
    ]);
