import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/models/task_model.dart';

class TaskChangeNotifier extends StateNotifier<List<TaskModel>> {
  TaskChangeNotifier() : super(_tasks);

  static final List<TaskModel> _tasks = [
    TaskModel(
      title: "titletitletitletitletitletitletitletitle",
      description:
          "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
      dueDateTime: DateTime.now(),
      status: taskStatusTodo,
    ),
    TaskModel(
      title: "title2",
      description: "description2",
      dueDateTime: DateTime.now(),
      status: taskStatusDoing,
    ),
    TaskModel(
      title: "title3",
      description: "description3",
      dueDateTime: DateTime.now(),
      status: taskStatusDone,
    )
  ];
}
