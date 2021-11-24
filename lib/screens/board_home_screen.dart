import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/screens/tasks/tasks_index.dart';
import 'package:board/screens/settings/settings_index.dart';
import 'package:board/state/tab_state.dart';

class BoardHomeScreen extends ConsumerWidget {
  BoardHomeScreen({
    Key? key,
  }) : super(key: key);

  final List<Widget> tabs = [
    const TasksIndexScreen(),
    const SettingsIndexScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tappedTabIndex = ref.watch(tabProvider);

    return Scaffold(
      body: tabs[tappedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tappedTabIndex,
        onTap: (int index) {
          ref.read(tabProvider.notifier).changeTab(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'タスク'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}
