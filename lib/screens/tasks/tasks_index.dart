import 'package:flutter/material.dart';

class TasksIndexScreen extends StatelessWidget {
  const TasksIndexScreen({Key? key}) : super(key: key);

  void onPressed() {
    print('onpressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク画面'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('task screen'),
          ],
        ),
      ),
    );
  }
}
