import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/view/pages/create_account_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/authentication/view/widget/button.widget.dart';
import 'package:flutter_application_1/features/authentication/view/widget/link_text_widget.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routePath = "/ForgotPasswordPage";

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => context.push(SignInPage.routePath),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "Forgot Password",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(250, 55, 63, 74),
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(250, 118, 124, 131)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(250, 55, 63, 74)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter the email address you used to create your account and we will email you a link to reset yout password.",
                  style: TextStyle(
                    color: const Color.fromARGB(250, 226, 227, 228),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(text: "CONTINUE", onTap: () {}),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        color: const Color.fromARGB(250, 226, 227, 228),
                      ),
                    ),
                    LinkWidget(
                      text: "Register",
                      onTap: () => context.push(SignUpPage.routePath),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
