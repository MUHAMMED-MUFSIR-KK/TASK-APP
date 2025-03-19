import 'package:flutter_application_1/main.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showMessage(String message) {
    MyApp.scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: Colors.amber,
      content: Center(
        child: Text(message),
      ),
    ));
  }
}
