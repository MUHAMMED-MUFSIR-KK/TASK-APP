import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/categories/view/pages/settings_page.dart';
import 'package:flutter_application_1/features/categories/view_model/task_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesPage extends HookConsumerWidget {
  static const routerPath = "/CategoriesPage";
  CategoriesPage({super.key});

  final bool addingTask = false;

  final titleController = TextEditingController();

  final titleEmojiController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskControllerProvider);
    final formKey = GlobalKey<FormState>();
    final toggle = useState(true);
    void onTap() {
      toggle.value = !toggle.value;
    }

    void addedPressed() {
      if (formKey.currentState!.validate()) {
        ref
            .read(taskControllerProvider.notifier)
            .addTask(titleController.text, titleEmojiController.text);
      }
      onTap();
      titleController.clear();
      titleEmojiController.clear();
    }

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
                              "Muhammad Mufsir kk",
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
                      onTap: onTap,
                      child: CircleAvatar(
                          radius: 25,
                          child: Icon(
                            Icons.add,
                            size: 40,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: state.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Center(
                        child: Text('Error: $error',
                            style: const TextStyle(color: Colors.white))),
                    data: (tasks) {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 180 / 130,
                        ),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(250, 55, 63, 74),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 44, 44, 44),
                                      offset: const Offset(0, 2),
                                      spreadRadius: 1.2)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.emoji,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Text(
                                    task.title,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  const Text(
                                    "0 task",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            if (!toggle.value)
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: titleEmojiController,
                                validator: (val) {
                                  return ref
                                      .read(taskControllerProvider.notifier)
                                      .taskValidate(val.toString());
                                },
                                style: TextStyle(fontSize: 25),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Title emoji ',
                                    hintStyle: TextStyle(
                                        fontSize: 25,
                                        color: const Color.fromARGB(
                                            250, 118, 124, 131))),
                              ),
                              TextFormField(
                                controller: titleController,
                                validator: (val) {
                                  return ref
                                      .read(taskControllerProvider.notifier)
                                      .taskValidate(val.toString());
                                },
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
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
                                    color: const Color.fromARGB(
                                        250, 118, 124, 131)),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          onTap();
                                        },
                                        icon: Icon(Icons.close)),
                                    TextButton(
                                        onPressed: () => addedPressed(),
                                        child: Text("Add"))
                                  ],
                                ),
                              )
                            ],
                          ),
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
