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

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dueDateTime: DateTime.parse(json["dueDateTime"]).toLocal(),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "dueDateTime": dueDateTime.toUtc().toIso8601String(),
        "status": status
      };
}
