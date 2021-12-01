import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/models/task_model.dart';
import 'package:board/providers/board_route_delegate_provider.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.dueDateTime,
    required this.status,
  }) : super(key: key);

  final String id;
  final String title;
  final String description;
  final DateTime dueDateTime;
  final String status;

  Color? statusColor() {
    if (status == taskStatusTodo) {
      return Colors.lime[100];
    }

    if (status == taskStatusDone) {
      return Colors.brown[100];
    }

    return Colors.amber;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: statusColor(),
                  ),
                  child: Text(status),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('詳細へ'),
                  onPressed: () {
                    ref.read(boardRouteDelegateProvider).setModeToDetails(id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
