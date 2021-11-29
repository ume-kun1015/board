import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/viewmodels/task_detail_change_notifier.dart';
import 'package:board/models/task_model.dart';
import 'package:board/infra/sqlite/tasks.dart';

final taskDetailProvider =
    StateNotifierProvider<TaskDetailChangeNotifier, TaskModel>(
  (ref) => TaskDetailChangeNotifier(repository: TaskSqlite()),
);
