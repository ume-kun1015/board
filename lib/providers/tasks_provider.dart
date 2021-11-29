import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/viewmodels/task_list_change_notifier.dart';
import 'package:board/models/task_model.dart';
import 'package:board/infra/sqlite/tasks.dart';

final tasksProvider =
    StateNotifierProvider<TaskListChangeNotifier, List<TaskModel>>(
  (ref) => TaskListChangeNotifier(repository: TaskSqlite()),
);
