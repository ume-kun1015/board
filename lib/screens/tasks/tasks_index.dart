import 'package:board/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:board/components/tasks/tasks_todo_list.dart';
import 'package:board/components/tasks/tasks_doing_list.dart';
import 'package:board/components/tasks/tasks_done_list.dart';
import 'package:board/providers/board_route_delegate_provider.dart';
import 'package:board/providers/tasks_provider.dart';

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

class TasksIndexScreen extends HookConsumerWidget {
  const TasksIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
      initialLength: taskStatusTabs.length,
    );

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        return;
      }

      var status = taskStatusTodo;
      if (tabController.index == 1) {
        status = taskStatusDoing;
      } else if (tabController.index == 2) {
        status = taskStatusDone;
      }

      ref.read(tasksProvider.notifier).findByStatus(status);
    });

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
                controller: tabController,
                onTap: (int tapped) {
                  var status = taskStatusTodo;
                  if (tapped == 1) {
                    status = taskStatusDoing;
                  } else if (tapped == 2) {
                    status = taskStatusDone;
                  }

                  ref.read(tasksProvider.notifier).findByStatus(status);
                },
                tabs: taskStatusTabs.map((TaskStatusTabModel taskStatusTab) {
                  return Tab(
                    text: taskStatusTab.title,
                  );
                }).toList(),
              ),
            ),
            HookBuilder(
              builder: (context) {
                final snapshot = useFuture(
                  useMemoized(
                    () => ref
                        .read(tasksProvider.notifier)
                        .findByStatus(taskStatusTodo),
                    [
                      tasksProvider.toString(),
                    ],
                  ),
                );

                return snapshot.connectionState == ConnectionState.waiting
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const <Widget>[
                            TasksTodoList(),
                            TasksDoingList(),
                            TasksDoneList(),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
