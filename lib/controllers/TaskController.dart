import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_todo_app/models/Task.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class TaskController extends GetxController {
  List<Task> tasks = []
      .map(
        (task) => Task(
            id: task['id'],
            title: task['title'],
            description: task['description'],
            isDone: task['isDone']),
      )
      .toList()
      .obs;

  //yeni bir task eklemek için
  void addTask(title, description) {
    Task task = new Task(
        id: Uuid().v4(), title: title, description: description, isDone: false);
    tasks = [...tasks, task];
  }

  //listeden bir task'ı çıkarmak için
  void removeTask(id) {
    tasks.removeWhere((task) => task.id == id);

    Get.snackbar(
      "Notification",
      "task successfully removed.",
      backgroundColor: Colors.yellow,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }

  //bir task'ı tamamlandı olarak işaretlemek için
  void taskIsDone(id) {
    tasks.indexWhere((task) =>
        task.id == id ? task.isDone = !task.isDone : task.isDone = task.isDone);

    Get.snackbar(
      "Notification",
      "task status updated.",
      backgroundColor: Colors.yellow,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }
}
