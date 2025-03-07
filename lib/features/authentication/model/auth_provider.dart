import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/authentication/view_model/auth_services.dart';
import 'package:flutter_application_1/features/todo/view/pages/categories_page.dart';

class AuthProvider {
  final AuthServices authServices = AuthServices();
  User? _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  TextEditingController forgotController = TextEditingController();

  User? get user => _user;

  authProvider() {
    authServices.authStateChanges.listen((User? user) {
      _user = user;
    });
  }

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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  submitForm(signUpFormKey) {
    if (signUpFormKey.currentState!.validate()) {
      authServices.signUp(emailController.text, passwordController.text);
    }
  }

  loginForm(BuildContext context, signInFormKey) {
    signInFormKey.currentState!.validate();
    if (signInFormKey.currentState!.validate()) {
      authServices.signIn(emailController.text, passwordController.text);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return CategoriesPage();
        },
      ));
    }
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    forgotController.dispose();
  }
}
