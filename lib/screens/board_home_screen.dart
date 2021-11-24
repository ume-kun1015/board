import 'package:flutter/material.dart';

import 'package:board/screens/tasks/tasks_index.dart';
import 'package:board/screens/settings/settings_index.dart';

class BoardHomeScreen extends StatelessWidget {
  BoardHomeScreen({
    Key? key,
  }) : super(key: key);

  final List<Widget> tabs = [
    const TasksIndexScreen(),
    const SettingsIndexScreen()
  ];

  final tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'タスク'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}
