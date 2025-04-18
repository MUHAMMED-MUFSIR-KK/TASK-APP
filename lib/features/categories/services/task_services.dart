import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/features/categories/model/task_model.dart';

class TaskServices {
  final _tasksCollection = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("task");

  Future<void> addTask(String title, String emoji) async {
    try {
      await _tasksCollection.add({
        'title': title,
        'emoji': emoji,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding task: ${e.toString()}");
      rethrow;
    }
  }

  Future<List<TaskModel>> taskDataFetching() async {
    try {
      final List<TaskModel> data = await _tasksCollection.get().then(
        (value) {
          return value.docs.map(
            (doc) {
              return TaskModel.fromJson(doc.data());
            },
          ).toList();
        },
      );
      return data;
    } catch (e) {
      print("  error data fetching ${e.toString()}");
      rethrow;
    }
  }
}
