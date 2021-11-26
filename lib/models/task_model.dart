import 'package:uuid/uuid.dart';

const String taskStatusTodo = 'TODO';
const String taskStatusDoing = 'DOING';
const String taskStatusDone = 'DONE';

class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.dueDateTime,
    required this.status,
  });

  final Uuid id = const Uuid();
  final String title;
  final String description;
  final DateTime dueDateTime;
  final String status;
}
