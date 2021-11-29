import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/repositories/task_repository.dart';
import 'package:board/models/task_model.dart';

class TaskDetailChangeNotifier extends StateNotifier<TaskModel> {
  TaskDetailChangeNotifier({required this.repository})
      : super(TaskModel.empty());

  final TaskRepository repository;

  Future<void> findById(String taskId) async {
    return repository.find(taskId).then((value) {
      state = value;
    }).catchError((dynamic error) {});
  }

  Future<TaskModel> createTask(TaskModel taskModel) async {
    return repository.create(taskModel);
  }

  Future<void> editTask(String taskId, TaskModel taskModel) async {
    return repository.update(taskId, taskModel).then((value) {
      state = value;
    }).catchError((dynamic error) {});
  }
}
