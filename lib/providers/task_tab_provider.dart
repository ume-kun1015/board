import 'package:board/viewmodels/task_status_tab_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskTabChangeProvider =
    StateNotifierProvider<TaskStatusTabChangeNotifier, int>(
  (ref) => TaskStatusTabChangeNotifier(),
);
