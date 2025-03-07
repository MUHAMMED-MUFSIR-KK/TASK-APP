import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/authentication/view/widget/button.widget.dart';
import 'package:flutter_application_1/features/authentication/view/widget/link_text_widget.dart';

import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  static const routePath = "/CreateAccountPage";

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: ListView(
        children: [
          Form(
            key: signUpFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                        color: Colors.white,
                        onPressed: () {
                          context.push(SignInPage.routePath);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      "Create an Account",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(250, 55, 63, 74),
                          filled: true,
                          hintText: "Full Name",
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
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(250, 55, 63, 74),
                          filled: true,
                          hintText: "Confirm Password",
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
                        height: 20,
                      ),
                      ButtonWidget(text: "CONTINUE", onTap: () {}),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(
                              color: const Color.fromARGB(250, 226, 227, 228),
                            ),
                          ),
                          LinkWidget(
                            text: "Log In",
                            onTap: () => context.push(SignInPage.routePath),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
