import 'package:flutter/material.dart';

class TasksCreateScreen extends StatelessWidget {
  const TasksCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク作成'),
      ),
    );
  }
}
