import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/view/pages/create_account_page.dart';
import 'package:flutter_application_1/features/authentication/view/pages/forgot_page.dart';
import 'package:flutter_application_1/features/authentication/view/widget/button.widget.dart';
import 'package:flutter_application_1/features/authentication/view/widget/link_text_widget.dart';

import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  static const routePath = "/LoginPage";

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: signInFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image(
                            image: AssetImage("assets/images/mimo1.png"))),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(250, 55, 63, 74),
                        filled: true,
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(250, 118, 124, 131)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.values[1],
                                color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.values[1],
                              color: const Color.fromARGB(250, 55, 63, 74)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(250, 55, 63, 74),
                        filled: true,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(250, 118, 124, 131)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.values[1],
                            color: const Color.fromARGB(250, 55, 63, 74),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => context.push(ForgotPasswordPage.routePath),
                      child: Text(
                        " Forgot Password?",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(text: "CONTINUE", onTap: () async {}),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
