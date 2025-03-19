import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/authentication/view/pages/login_page.dart';
import 'package:flutter_application_1/features/authentication/view/widget/button.widget.dart';
import 'package:flutter_application_1/features/authentication/view/widget/link_text_widget.dart';
import 'package:flutter_application_1/features/authentication/view_model/auth_controller.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  static const routePath = "/SignUpPage";

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passWordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    void onSignUpButtonPressed() {
      if (formKey.currentState!.validate()) {
        ref
            .read(authControllerProvider.notifier)
            .signUp(emailController.text, passWordController.text);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: ListView(
        children: [
          Form(
            key: formKey,
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
                          context.push(LogInPage.routePath);
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
                        controller: nameController,
                        validator: ref
                            .read(authControllerProvider.notifier)
                            .validateName,
                        style: TextStyle(color: Colors.white),
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
                        controller: emailController,
                        validator: ref
                            .read(authControllerProvider.notifier)
                            .validateEmail,
                        style: TextStyle(color: Colors.white),
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
                        controller: passWordController,
                        validator: ref
                            .read(authControllerProvider.notifier)
                            .validatePassword,
                        style: TextStyle(color: Colors.white),
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
                        controller: confirmPasswordController,
                        validator: (value) => ref
                            .read(authControllerProvider.notifier)
                            .validateConfirmPassword(
                              value,
                              passWordController.text,
                            ),
                        style: TextStyle(color: Colors.white),
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
                      ButtonWidget(
                          text: "CONTINUE",
                          onTap: () {
                            onSignUpButtonPressed();
                          }),
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
                            onTap: () => context.push(LogInPage.routePath),
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
