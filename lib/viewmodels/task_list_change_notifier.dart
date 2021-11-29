import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/repositories/task_repository.dart';
import 'package:board/models/task_model.dart';

class TaskListChangeNotifier extends StateNotifier<List<TaskModel>> {
  TaskListChangeNotifier({required this.repository}) : super([]);

  final TaskRepository repository;

  Future<void> findByStatus(String status) async {
    return repository.findByStatus(status).then((value) {
      state = value;
    }).catchError((dynamic error) {});
  }

  Future<void> add(TaskModel task) async {
    return repository.create(task).then((value) {
      state = [...state, value];
    }).catchError((dynamic error) {});
  }

  Future<void> edit(String taskId, TaskModel taskModel) async {
    return repository.update(taskId, taskModel).then((value) {
      return repository.findByStatus(taskStatusDone);
    }).then((newList) {
      state = [...newList];
    }).catchError((dynamic error) {});
  }
}
