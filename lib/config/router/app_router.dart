import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_manage_app/config/router/app_routes.dart';
import 'package:library_manage_app/feature/book/domain/usecase/book_service_impl.dart';
import 'package:library_manage_app/feature/book/presentation/view/screen/book_manage_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view/screen/book_single_view.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_single_view_model.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/resister_book_screen_view_model.dart';
import 'package:library_manage_app/feature/common/domain/model/book_loan.dart';
import 'package:library_manage_app/feature/common/presentation/screen/home_screen.dart';
import 'package:library_manage_app/feature/common/presentation/screen/splash_screen.dart';
import 'package:library_manage_app/feature/book/presentation/view_model/book_search_screen_view_model.dart';
import 'package:library_manage_app/feature/loan/presentation/view/screen/loan_manage_screen.dart';
import 'package:library_manage_app/feature/loan/presentation/view/screen/loan_single_view.dart';
import 'package:library_manage_app/feature/loan/presentation/view_model/loan_execute_screen_view_model.dart';
import 'package:provider/provider.dart';

import '../../feature/book/presentation/view/screen/resister_book_screen.dart';
import '../../feature/common/domain/enum/search_type.dart';
import '../../feature/book/presentation/view/screen/book_search_screen.dart';
import '../../feature/common/domain/model/book.dart';
import '../../feature/common/domain/model/user.dart';
import '../../feature/loan/domain/usecase/loan_service_impl.dart';
import '../../feature/loan/presentation/view/screen/loan_execute_screen.dart';
import '../../feature/loan/presentation/view/screen/loan_search_screen.dart';
import '../../feature/loan/presentation/view_model/loan_search_screen_view_model.dart';
import '../../feature/loan/presentation/view_model/loan_single_view_model.dart';
import '../../feature/user/domain/usecase/user_service_impl.dart';
import '../../feature/user/presentation/view/create_user_screen.dart';
import '../../feature/user/presentation/view/user_manage_screen.dart';
import '../../feature/user/presentation/view/user_search_screen.dart';
import '../../feature/user/presentation/view/user_single_view.dart';
import '../../feature/user/presentation/view_model/create_user_screen_view_model.dart';
import '../../feature/user/presentation/view_model/user_search_screen_view_model.dart';
import '../../feature/user/presentation/view_model/user_single_view_model.dart';
import '../../shared/drift/provider/drift_db_service.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
    debugLogDiagnostics: true,
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
            // 이하 book
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ChangeNotifierProvider(
                  create: (cntxt) => BookServiceProvider(
                      db: context
                          .watch<LoacalDatabaseProvider>()
                          .driftDbService
                          .driftDB),
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
                            ),
                        routes: [
                          GoRoute(
                              path: 'book_single',
                              name: AppRoutes.bookSingle,
                              builder:
                                  (BuildContext context, GoRouterState state) {
                                return ChangeNotifierProvider(
                                  create: (cntxt) => BookSingViewModel(
                                      book: state.extra as Book),
                                  child: const BookSingleView(),
                                );
                              }),
                        ])
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
                          bookService:
                              context.watch<BookServiceProvider>().bookService,
                        ),
                        child: BookSearchScreen(),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // 이하 loan
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                        create: (cntxt) => LoanServiceProvider(
                            db: context
                                .watch<LoacalDatabaseProvider>()
                                .driftDbService
                                .driftDB)),
                    ChangeNotifierProvider<BookServiceProvider>(
                        create: (cntxt) => BookServiceProvider(
                            db: context
                                .watch<LoacalDatabaseProvider>()
                                .driftDbService
                                .driftDB)),
                    ChangeNotifierProvider<UserServiceProvider>(
                        create: (cntxt) => UserServiceProvider(
                            db: context
                                .watch<LoacalDatabaseProvider>()
                                .driftDbService
                                .driftDB))
                  ],
                  child: LoanManageScreen(navigationShell: navigationShell),
                );
              },
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'loan_execute',
                        name: AppRoutes.loanExecute,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => LoanExecuteScreenViewModel(
                                  loanService: context
                                      .watch<LoanServiceProvider>()
                                      .loanService),
                              child: const LoanExecuteScreen(),
                            ),
                        routes: [
                          GoRoute(
                            path: 'loan_book_search',
                            name: AppRoutes.loanBookSearch,
                            builder:
                                (BuildContext context, GoRouterState state) =>
                                    ChangeNotifierProvider(
                              create: (cntxt) => BookSearchScreenViewModel(
                                isInLoanSreen: true,
                                bookService: context
                                    .watch<BookServiceProvider>()
                                    .bookService,
                              ),
                              child:
                                  BookSearchScreen(isBackButtonEnabled: false),
                            ),
                          ),
                          GoRoute(
                              path: 'loan_user_search',
                              name: AppRoutes.loanUserSearch,
                              builder:
                                  (BuildContext context, GoRouterState state) =>
                                      ChangeNotifierProvider(
                                        create: (cntxt) =>
                                            UserSearchScreenViewModel(
                                          isInLoanSreen: true,
                                          userService: context
                                              .watch<UserServiceProvider>()
                                              .userService,
                                        ),
                                        child: UserSearchScreen(
                                          isBackButtonEnabled: false,
                                        ),
                                      )),
                        ]),
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
                                    .loanService,
                              ),
                              child: LoanSearchScreen(),
                            )),
                    GoRoute(
                      path: 'loan_single',
                      name: AppRoutes.loanSingle,
                      builder: (context, state) => ChangeNotifierProvider(
                          create: (cntxt) => LoanSingleViewModel(
                              loan: state.extra as BookLoan),
                          child: const LoanSingleView()),
                    )
                  ],
                ),
              ],
            ),

            // 이하 user
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return ChangeNotifierProvider(
                  create: (cntxt) => UserServiceProvider(
                      db: context
                          .watch<LoacalDatabaseProvider>()
                          .driftDbService
                          .driftDB),
                  child: UserManageScreen(navigationShell: navigationShell),
                );
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'create_user',
                        name: AppRoutes.createUser,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => CreateUserScreenViewModel(
                                  userService: context
                                      .watch<UserServiceProvider>()
                                      .userService),
                              child: CreateUserScreen(),
                            ),
                        routes: [
                          GoRoute(
                              path: 'user_single',
                              name: AppRoutes.userSingle,
                              builder:
                                  (BuildContext context, GoRouterState state) {
                                return ChangeNotifierProvider(
                                  create: (cntxt) => UserSingleViewModel(
                                      user: state.extra as User),
                                  child: const UserSingleView(),
                                );
                              }),
                        ])
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                        path: 'user_search',
                        name: AppRoutes.userSearch,
                        builder: (BuildContext context, GoRouterState state) =>
                            ChangeNotifierProvider(
                              create: (cntxt) => UserSearchScreenViewModel(
                                userService: context
                                    .watch<UserServiceProvider>()
                                    .userService,
                              ),
                              child: UserSearchScreen(),
                            )),
                  ],
                ),
              ],
            ),
          ]),
    ]);

// final GoRouter appRouter2 = GoRouter(
//     debugLogDiagnostics: true,
//     initialLocation: '/splash',
//     redirect: (BuildContext context, GoRouterState state) async {
//       print('redirection ${state.name}');
//     },
//     routes: [
//       GoRoute(
//           path: '/splash',
//           name: AppRoutes.splash,
//           builder: (BuildContext context, GoRouterState state) {
//             return const SplashScreen();
//           }),
//       GoRoute(
//           path: '/home',
//           name: AppRoutes.home,
//           builder: (BuildContext context, GoRouterState state) => HomeScreen(),
//           routes: [
//             ShellRoute(
//               builder: (context, state, child) {
//                 return MultiProvider(
//                   providers: [
//                     ChangeNotifierProvider(
//                         create: (cntxt) => LoanServiceProvider(
//                             db: context
//                                 .watch<LoacalDatabaseProvider>()
//                                 .driftDbService
//                                 .driftDB)),
//                     ChangeNotifierProvider<BookServiceProvider>(
//                         create: (cntxt) => BookServiceProvider(
//                             db: context
//                                 .watch<LoacalDatabaseProvider>()
//                                 .driftDbService
//                                 .driftDB)),
//                     ChangeNotifierProvider<UserServiceProvider>(
//                         create: (cntxt) => UserServiceProvider(
//                             db: context
//                                 .watch<LoacalDatabaseProvider>()
//                                 .driftDbService
//                                 .driftDB))
//                   ],
//                   child: LoanManageScreen(child: child),
//                 );
//               },
//               routes: [
//                 GoRoute(
//                     path: 'loan_execute',
//                     name: AppRoutes.loanExecute,
//                     builder: (BuildContext context, GoRouterState state) =>
//                         ChangeNotifierProvider(
//                           create: (cntxt) => LoanExecuteScreenViewModel(),
//                           child: const LoanExecuteScreen(),
//                         ),
//                     routes: [
//                       GoRoute(
//                         path: 'loan_book_search',
//                         name: AppRoutes.loanBookSearch,
//                         builder: (BuildContext context, GoRouterState state) =>
//                             ChangeNotifierProvider(
//                           create: (cntxt) => BookSearchScreenViewModel(
//                             isInLoanSreen: true,
//                             bookService: context
//                                 .watch<BookServiceProvider>()
//                                 .bookService,
//                           ),
//                           child: BookSearchScreen(isBackButtonEnabled: false),
//                         ),
//                       ),
//                       GoRoute(
//                           path: 'loan_user_search',
//                           name: AppRoutes.loanUserSearch,
//                           builder: (BuildContext context,
//                                   GoRouterState state) =>
//                               ChangeNotifierProvider(
//                                 create: (cntxt) => UserSearchScreenViewModel(
//                                   isInLoanSreen: true,
//                                   userService: context
//                                       .watch<UserServiceProvider>()
//                                       .userService,
//                                 ),
//                                 child: UserSearchScreen(
//                                   isBackButtonEnabled: false,
//                                 ),
//                               )),
//                     ]),
//                 GoRoute(
//                     path: 'loan_search',
//                     name: AppRoutes.loanSearch,
//                     builder: (BuildContext context, GoRouterState state) =>
//                         ChangeNotifierProvider(
//                           create: (cntxt) => LoanSearchScreenViewModel(
//                             loanService: context
//                                 .watch<LoanServiceProvider>()
//                                 .loanService,
//                           ),
//                           child: LoanSearchScreen(),
//                         )),
//               ],
//             )
//           ]),
//     ]);
