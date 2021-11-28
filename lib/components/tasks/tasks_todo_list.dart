import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/components/tasks/task_card.dart';
import 'package:board/providers/tasks_state.dart';

class TasksTodoList extends ConsumerWidget {
  const TasksTodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return ListView.builder(
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
    );
  }
}
