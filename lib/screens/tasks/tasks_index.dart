import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/components/tasks/tasks_todo_list.dart';
import 'package:board/components/tasks/tasks_doing_list.dart';
import 'package:board/components/tasks/tasks_done_list.dart';
import 'package:board/state/board_route_delegate_state.dart';

class TaskStatusTabModel {
  const TaskStatusTabModel({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<TaskStatusTabModel> taskStatusTabs = [
  TaskStatusTabModel(title: 'TODO', icon: Icons.task),
  TaskStatusTabModel(title: 'DOING', icon: Icons.directions_bike),
  TaskStatusTabModel(title: 'DONE', icon: Icons.directions_boat),
];

class TasksIndexScreen extends ConsumerWidget {
  const TasksIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(boardRouteDelegateProvider).setModeToCreate();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DefaultTabController(
          length: taskStatusTabs.length,
          initialIndex: 0,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: TabBar(
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.black,
                  tabs: taskStatusTabs.map((TaskStatusTabModel taskStatusTab) {
                    return Tab(
                      text: taskStatusTab.title,
                    );
                  }).toList(),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    TasksTodoList(),
                    TasksDoingList(),
                    TasksDoneList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
