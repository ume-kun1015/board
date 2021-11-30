import 'package:board/repositories/task_repository.dart';
import 'package:board/models/task_model.dart';
import 'package:board/infra/sqlite/init.dart';

class TaskSqlite implements TaskRepository {
  TaskSqlite({required this.client});

  SqliteClient client;
  final String _tableName = 'tasks';

  @override
  Future<TaskModel> find(String taskId) async {
    final database = await client.database;
    final res = await database
        .rawQuery("select * from $_tableName where id = '$taskId'");
    final tasks = res.map((c) => TaskModel.fromMap(c)).toList();
    return tasks.isEmpty ? TaskModel.empty() : tasks[0];
  }

  @override
  Future<List<TaskModel>> findByStatus(String status) async {
    final database = await client.database;
    final res = await database
        .rawQuery("select * from $_tableName where status = '$status'");
    return res.map((c) => TaskModel.fromMap(c)).toList();
  }

  @override
  Future<TaskModel> create(TaskModel task) async {
    final database = await client.database;
    await database.insert(_tableName, task.toMap());
    return task;
  }

  @override
  Future<TaskModel> update(String taskId, TaskModel task) async {
    final database = await client.database;
    await database.update(
      _tableName,
      task.toMap(),
      where: "id = ?",
      whereArgs: [taskId],
    );
    return task;
  }
}
