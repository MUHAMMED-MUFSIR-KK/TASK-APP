import 'package:flutter_application_1/core/router/utils/snackbar_utils.dart';
import 'package:flutter_application_1/features/authentication/services/auth_services.dart';

import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/categories/view/pages/categories_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  final authservice = AuthServices();
  @override
  void build() {
    authservice.authStateChanges.listen((user) {
      if (user != null) {
        MyApp.navigatorKey.currentContext!.go(CategoriesPage.routerPath);
      } else {
        MyApp.navigatorKey.currentContext?.go(LogInPage.routePath);
      }
    });
  }

  Future<void> signUp(String email, String password) async {
    try {
      await authservice.signUp(email, password);

      SnackbarUtils.showMessage(" Success ");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await authservice.signOut();

      SnackbarUtils.showMessage(" LogOut Success ");
      MyApp.navigatorKey.currentContext?.go(LogInPage.routePath);
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await authservice.signIn(email, password);
      SnackbarUtils.showMessage("Login Success");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await authservice.passwordReset(email);
      SnackbarUtils.showMessage("Password reset email sent!");
    } catch (e) {
      SnackbarUtils.showMessage(e.toString());
    }
  }

  // validation

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
