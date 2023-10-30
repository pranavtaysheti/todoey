import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Task",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            textAlign: TextAlign.center,
            onChanged: (value) {
              newTaskText = value;
            },
            autofocus: true,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskText);
              Navigator.pop(context);
            },
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                LinearBorder(),
              ),
              backgroundColor: MaterialStatePropertyAll(
                Colors.lightBlueAccent,
              ),
            ),
            child: const Text(
              "Add",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
