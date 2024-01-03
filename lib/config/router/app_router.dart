import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/book/data/repository_impl/book_service_impl.dart';
import 'package:library_manage_app/feature/book/presentation/view/screen/book_manage_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/feature/common/presentation/screen/home_screen.dart';
import 'package:library_manage_app/feature/common/presentation/screen/splash_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_search_screen_view_model.dart';
import 'package:library_manage_app/feature/loan/presentation/view/screen/loan_manage_screen.dart';
import 'package:library_manage_app/feature/loan/presentation/view_model/loan_execute_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../feature/book/presentation/view/screen/resister_book_screen.dart';
import '../../feature/book/presentation/view_model/book_single_view_model.dart';
import '../../feature/common/domain/enum/search_type.dart';
import '../../feature/book/presentation/view/screen/book_search_screen.dart';
import '../../feature/loan/data/repository_impl/loan_service_impl.dart';
import '../../feature/loan/presentation/view/screen/loan_execute_screen.dart';
import '../../feature/loan/presentation/view/screen/loan_search_screen.dart';
import '../../feature/loan/presentation/view_model/loan_search_screen_view_model.dart';

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
            // 이하 book
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
                        path: 'resister_book',
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
                        path: 'book_search',
                        name: AppRoutes.bookSearch,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => BookSearchScreenViewModel(
                                bookService: context
                                    .watch<BookServiceProvider>()
                                    .bookService,
                                searchType: SearchType.book,
                              ),
                              child: BookSearchScreen(),
                            )),
                  ],
                ),
              ],
            ),

            // 이하 loan
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ChangeNotifierProvider(
                  create: (cntxt) => LoanServiceProvider(),
                  child: LoanManageScreen(navigationShell: navigationShell),
                );
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'loan_execute',
                        name: AppRoutes.loanExecute,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => LoanExecuteScreenViewModel(),
                              child: LoanExecuteScreen(),
                            ))
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'loan_search',
                        name: AppRoutes.loanSearch,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => LoanSearchScreenViewModel(
                                loanService: context
                                    .watch<LoanServiceProvider>()
                                    .bookService,
                                searchType: SearchType.book,
                              ),
                              child: LoanSearchScreen(),
                            )),
                  ],
                ),
              ],
            ),
          ])
    ]);
