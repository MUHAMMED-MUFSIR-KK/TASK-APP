import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/view_model/auth_controller.dart';
import 'package:flutter_application_1/features/todo/view/pages/categories_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookConsumerWidget {
  static const routePath = "/SettingsScreen";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogOutButtonPressed() {
      ref.read(authControllerProvider.notifier).logOut();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () => context.push(CategoriesPage.routerPath),
                  icon: Icon(Icons.arrow_back, size: 30),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 28,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mohammed Mufsir kk",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          "Kerala India",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(250, 118, 124, 131)),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(250, 55, 63, 74),
                      child: IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.edit, size: 25, color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Hi! My name is Mufsir, I'm a community manager ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                        color: Colors.white),
                    Text(
                      "Notification",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        color: Colors.white),
                    Text(
                      "General",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle),
                        color: Colors.white),
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info),
                        color: Colors.white),
                    Text(
                      "About",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                  //
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          onLogOutButtonPressed();
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.white),
                    Text(
                      "LogOut",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                  //
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
