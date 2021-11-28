import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/providers/board_route_delegate_state.dart';

class TasksDetailScreen extends ConsumerWidget {
  const TasksDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delegate = ref.watch(boardRouteDelegateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(delegate.selectedTaskId ?? ''),
      ),
    );
  }
}
