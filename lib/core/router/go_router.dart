import 'package:flutter_application_1/features/authentication/view/pages/signup_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/forgot_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/todo/view/pages/categories_page.dart';
import 'package:flutter_application_1/features/todo/view/pages/settings_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: LogInPage.routePath,
  navigatorKey: MyApp.navigatorKey,
  routes: [
    GoRoute(
      path: "/LogInPage",
      builder: (context, state) => const LogInPage(),
      // redirect: (context, state) {
      //   final auth = AuthServices();
      //   final user = auth.getCurrentUser();
      //   if (user != null) {
      //     return CategoriesPage.routerPath;
      //   }
      //   return null;
      // },
    ),
    GoRoute(
      path: "/SignUpPage",
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: "/ForgotPasswordPage",
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: "/CategoriesPage",
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: "/SettingsScreen",
      builder: (context, state) => SettingsScreen(),
    ),
  ],
);
