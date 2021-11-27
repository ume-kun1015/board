import 'package:flutter/material.dart';

import 'package:board/screens/tasks/tasks_detail.dart';
import 'package:board/screens/board_home_screen.dart';

class BoardRouterDelegate extends RouterDelegate<void>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<void> {
  String? taskId;

  @override
  get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(void configuration) async {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BoardHomeScreen'),
          child: BoardHomeScreen(),
        ),
        if (taskId != null)
          MaterialPage(
            key: ValueKey(taskId),
            child: TasksDetailScreen(id: taskId!),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        taskId = null;

        notifyListeners();
        return true;
      },
    );
  }
}
