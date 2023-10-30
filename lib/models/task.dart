class Task {
  String taskText;
  bool taskStatus;

  Task({required this.taskText, required this.taskStatus});

  void changeStatus(bool newStatus) {
    taskStatus = newStatus;
  }
}
