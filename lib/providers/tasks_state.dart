import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/viewmodels/task_change_notifier.dart';
import 'package:board/models/task_model.dart';

final tasksProvider =
    StateNotifierProvider<TaskChangeNotifier, List<TaskModel>>(
  (ref) => TaskChangeNotifier(),
);
