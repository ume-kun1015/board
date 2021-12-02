import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/models/task_model.dart';

class TaskStatusTabChangeNotifier extends StateNotifier<int> {
  TaskStatusTabChangeNotifier() : super(_initialTaskTab);

  static const _initialTaskTab = 0;

  void changeTab(String tapped) {
    if (tapped == taskStatusDoing) {
      state = 1;
    } else if (tapped == taskStatusDone) {
      state = 2;
    } else {
      state = 0;
    }
  }
}
