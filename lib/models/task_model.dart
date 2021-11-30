import 'package:uuid/uuid.dart';

const String taskStatusTodo = 'TODO';
const String taskStatusDoing = 'DOING';
const String taskStatusDone = 'DONE';

class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDateTime,
    required this.status,
  });

  String id = const Uuid().v4();
  final String title;
  final String description;
  final DateTime dueDateTime;
  final String status;

  TaskModel.empty()
      : id = '',
        title = '',
        description = '',
        dueDateTime = DateTime.now(),
        status = taskStatusTodo;

  TaskModel.emptyWithoutId(String id)
      : title = '',
        description = '',
        dueDateTime = DateTime.now(),
        status = taskStatusTodo;

  setId(String id) {
    this.id = id;
  }

}
