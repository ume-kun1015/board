import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/components/tasks/task_card.dart';
import 'package:board/providers/tasks_state.dart';
import 'package:board/models/task_model.dart';

class TasksDoneList extends ConsumerWidget {
  const TasksDoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return RefreshIndicator(
      onRefresh: () {
        return ref.read(tasksProvider.notifier).findByStatus(taskStatusDone);
      },
      child: ListView.builder(
        itemCount: tasks.length,
        padding: const EdgeInsets.only(bottom: 60.0),
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(
            id: tasks[index].id,
            title: tasks[index].title,
            description: tasks[index].description,
            dueDateTime: tasks[index].dueDateTime,
            status: tasks[index].status,
          );
        },
      ),
    );
  }
}
