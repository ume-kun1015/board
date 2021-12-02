import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:board/models/task_model.dart';
import 'package:board/providers/board_route_delegate_provider.dart';
import 'package:board/providers/task_detail_provider.dart';
import 'package:board/providers/tasks_provider.dart';
import 'package:board/components/tasks/task_form.dart';

class TasksDetailScreen extends HookConsumerWidget {
  const TasksDetailScreen({
    Key? key,
  }) : super(key: key);

  void update(
    WidgetRef ref,
    String taskId,
    String previousTaskStatus,
    TaskModel task,
  ) {
    ref.watch(tasksProvider.notifier).edit(taskId, previousTaskStatus, task);
    ref.watch(boardRouteDelegateProvider.notifier).setModeToList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delegate = ref.watch(boardRouteDelegateProvider);

    final taskId = delegate.selectedTaskId ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク編集'),
      ),
      body: HookBuilder(
        builder: (context) {
          useFuture(
            useMemoized(
              () => ref.watch(taskDetailProvider.notifier).findById(taskId),
              [taskId],
            ),
          );

          final task = ref.watch(taskDetailProvider);
          if (task.id == '') {
            return const CircularProgressIndicator();
          }

          return TaskForm(
            taskId: task.id,
            title: task.title,
            description: task.description,
            dueDateTime: task.dueDateTime,
            status: task.status,
            onSaveTapped: (TaskModel newTask) {
              update(ref, taskId, task.status, newTask);

              ref.watch(boardRouteDelegateProvider.notifier).setModeToList();
            },
          );
        },
      ),
    );
  }
}
