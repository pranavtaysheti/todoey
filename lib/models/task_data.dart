import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _tasks = [
    Task(taskText: "Do Dishes", taskStatus: false),
    Task(taskText: "Complete Project", taskStatus: false),
    Task(taskText: "Hmm.. Nice", taskStatus: true),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskText) {
    _tasks.add(
      Task(taskText: taskText, taskStatus: false),
    );
    notifyListeners();
  }

  void changeTaskStatus(int index, bool newStatus) {
    _tasks[index].changeStatus(newStatus);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
