import 'package:board/repositories/task_repository.dart';
import 'package:board/models/task_model.dart';

final list = [
  TaskModel(
    title: "taskStatusTodo",
    description:
        "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
    dueDateTime: DateTime.now(),
    status: taskStatusTodo,
  ),
  TaskModel(
    title: "taskStatusTodo2",
    description: "description2",
    dueDateTime: DateTime.now(),
    status: taskStatusTodo,
  ),
  TaskModel(
    title: "taskStatusTodo3",
    description: "description3",
    dueDateTime: DateTime.now(),
    status: taskStatusTodo,
  )
];

class TaskSqlite implements TaskRepository {
  @override
  Future<TaskModel> find(String taskId) {
    return Future.value(list[0]);
  }

  @override
  Future<List<TaskModel>> findByStatus(String status) {
    if (status == taskStatusDoing) {
      return Future.value(
        [
          TaskModel(
            title: "taskStatusDoing",
            description:
                "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
            dueDateTime: DateTime.now(),
            status: taskStatusDoing,
          ),
        ],
      );
    }

    if (status == taskStatusDone) {
      return Future.value(
        [
          TaskModel(
            title: "taskStatusDone",
            description:
                "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
            dueDateTime: DateTime.now(),
            status: taskStatusDone,
          ),
        ],
      );
    }

    return Future.value(list);
  }

  @override
  Future<TaskModel> create(TaskModel task) {
    return Future.value(task);
  }

  @override
  Future<TaskModel> update(String taskId, TaskModel task) {
    final foundIndex = list.indexWhere((e) => e.id == taskId);
    list[foundIndex] = task;

    print(list[foundIndex]);

    return Future.value(task);
  }
}
