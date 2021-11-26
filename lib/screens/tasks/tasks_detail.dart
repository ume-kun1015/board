import 'package:flutter/material.dart';

class TasksDetailScreen extends StatelessWidget {
  const TasksDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク詳細画面'),
      ),
    );
  }
}
