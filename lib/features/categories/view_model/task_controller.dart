import 'package:flutter_application_1/features/categories/model/task_model.dart';
import 'package:flutter_application_1/features/categories/services/task_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'task_controller.g.dart';

@riverpod
class TaskController extends _$TaskController {
  final taskServices = TaskServices();
  @override
  List<TaskModel> build() => [];

  Future<void> addTask(String title, String titleEmoji) async {
    await taskServices.addTask(title, titleEmoji);
  }

  String? taskValidate(String value) {
    if (value.isEmpty) {
      return "you must enter a value";
    }
    return null;
  }
}
