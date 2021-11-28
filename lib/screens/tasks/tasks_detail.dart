import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:board/providers/board_route_delegate_state.dart';
import 'package:board/providers/task_detail_state.dart';

class TasksDetailScreen extends HookConsumerWidget {
  const TasksDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delegate = ref.watch(boardRouteDelegateProvider);

    useFuture(
      useMemoized(
        () => ref
            .read(taskDetailProvider.notifier)
            .findById(delegate.selectedTaskId ?? ''),
        [
          delegate.selectedTaskId ?? '',
        ],
      ),
    );

    final task = ref.watch(taskDetailProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
    );
  }
}
