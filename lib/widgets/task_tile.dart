import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final int index;

  const TaskTile({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Provider.of<TaskData>(context).tasks[index].taskText,
        style: TextStyle(
          decoration: Provider.of<TaskData>(context).tasks[index].taskStatus
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: Provider.of<TaskData>(context).tasks[index].taskStatus,
        onChanged: (value) {
          if (value != null) {
            Provider.of<TaskData>(context, listen: false)
                .changeTaskStatus(index, value);
          }
        },
      ),
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(index);
      },
    );
  }
}
