import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/state/board_route_delegate_state.dart';

class TasksDetailScreen extends ConsumerWidget {
  const TasksDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

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