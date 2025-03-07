import 'package:flutter_application_1/features/authentication/view/pages/create_account_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/forgot_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/todo/view/pages/categories_page.dart';
import 'package:flutter_application_1/features/todo/view/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: SignUpPage.routePath,
  routes: [
    GoRoute(
      path: "/LoginPage",
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: "/CreateAccountPage",
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
