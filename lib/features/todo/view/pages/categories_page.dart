import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/todo/view/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatefulWidget {
  static const routerPath = "/CategoriesPage";
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool addingTask = false;

  void addTask() {
    setState(() {
      addingTask = !addingTask;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 46, 53, 64),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.push(SettingsScreen.routePath),
                      child: CircleAvatar(
                        radius: 25,
                      ),
                    ),
                    Center(
                        child: Text(
                      "Categories",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(Icons.search))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(250, 55, 63, 74),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 44, 44, 44),
                            offset: Offset(0, 2),
                            spreadRadius: 1.2)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The memories is a shield and life helper.",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "Muhameed Mufsir kk",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(250, 118, 124, 131)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 130,
                  width: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(250, 55, 63, 74),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 44, 44, 44),
                            offset: Offset(0, 2),
                            spreadRadius: 1.2)
                      ]),
                  child: Center(
                    child: GestureDetector(
                      onTap: addTask,
                      child: CircleAvatar(
                          radius: 25,
                          child: Icon(
                            Icons.add,
                            size: 40,
                          )),
                    ),
                  ),
                )
              ],
            ),
            if (addingTask)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Center(
                  child: Expanded(
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(250, 55, 63, 74),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Title emoji ',
                                  hintStyle: TextStyle(
                                      fontSize: 25,
                                      color: const Color.fromARGB(
                                          250, 118, 124, 131))),
                            ),
                            TextField(
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Title',
                                  hintStyle: TextStyle(
                                      fontSize: 25,
                                      color: const Color.fromARGB(
                                          250, 118, 124, 131))),
                            ),
                            Text(
                              "0 task",
                              style: TextStyle(
                                  fontSize: 25,
                                  color:
                                      const Color.fromARGB(250, 118, 124, 131)),
                            ),
                            IconButton(
                                onPressed: () {
                                  addTask();
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
