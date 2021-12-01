import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

import 'package:board/models/task_model.dart';
import 'package:board/components/tasks/task_form.dart';
import 'package:board/providers/board_route_delegate_provider.dart';
import 'package:board/providers/tasks_provider.dart';

class TasksCreateScreen extends HookConsumerWidget {
  const TasksCreateScreen({
    Key? key,
  }) : super(key: key);

  void create(WidgetRef ref, TaskModel task) {
    ref.read(tasksProvider.notifier).add(task);
    ref.read(boardRouteDelegateProvider.notifier).setModeToList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク作成'),
      ),
      body: HookBuilder(
        builder: (context) {
          return TaskForm(
            taskId: const Uuid().v4(),
            title: '',
            description: '',
            dueDateTime: DateTime.now(),
            status: taskStatusTodo,
            onSaveTapped: (TaskModel newTask) {
              create(ref, newTask);

              ref.read(boardRouteDelegateProvider.notifier).setModeToList();
            },
          );
        },
      ),
    );
  }
}
