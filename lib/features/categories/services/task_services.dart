import 'package:cloud_firestore/cloud_firestore.dart';

class TaskServices {
  final CollectionReference _tasksCollection =
      FirebaseFirestore.instance.collection("task");

  Future<void> addTask(String title, String titleEmoji) async {
    try {
      await _tasksCollection.add({
        'title': title,
        'emoji': titleEmoji,
        'createdAt': FieldValue.serverTimestamp(), // Optional: add timestamp
      });
    } catch (e) {
      print("Error adding task: ${e.toString()}");
      rethrow;
    }
  }
}
