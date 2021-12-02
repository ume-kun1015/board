import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/repositories/task_repository.dart';
import 'package:board/models/task_model.dart';
import 'package:board/providers/task_tab_provider.dart';

class TaskListChangeNotifier extends StateNotifier<List<TaskModel>> {
  TaskListChangeNotifier({required this.repository, required this.ref})
      : super([]);

  final TaskRepository repository;
  final StateNotifierProviderRef<TaskListChangeNotifier, List<TaskModel>> ref;

  Future<void> findByStatus(String status) async {
    return repository.findByStatus(status).then((value) {
      state = value;
    }).catchError((dynamic error) {});
  }

  Future<void> add(TaskModel task) async {
    return repository.create(task).then((value) {
      return repository.findByStatus(task.status);
    }).then((newList) {
      ref.watch(taskTabChangeProvider.notifier).changeTab(task.status);
      state = [...newList];
    }).catchError((dynamic error) {});
  }

  Future<void> edit(
    String taskId,
    TaskModel taskModel,
  ) async {
    return repository.update(taskId, taskModel).then((value) {
      return repository.findByStatus(taskModel.status);
    }).then((newList) {
      ref.watch(taskTabChangeProvider.notifier).changeTab(taskModel.status);
      state = [...newList];
    }).catchError((dynamic error) {});
  }
}
