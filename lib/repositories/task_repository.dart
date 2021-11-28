import 'package:board/models/task_model.dart';

abstract class TaskRepository {
  Future<TaskModel> find(String taskId);
  Future<List<TaskModel>> findByStatus(String status);
}
