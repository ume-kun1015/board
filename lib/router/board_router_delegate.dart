import 'package:flutter/material.dart';

import 'package:board/screens/tasks/tasks_detail.dart';
import 'package:board/screens/tasks/tasks_create.dart';
import 'package:board/screens/board_home_screen.dart';
import 'package:board/screens/not_found_screen.dart';
import 'package:board/router/board_route_path.dart';

class BoardRouterDelegate extends RouterDelegate<BoardRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BoardRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  get selectedTaskId => _selectedTaskId;

  String? _selectedTaskId;
  String _mode = 'list';

  BoardRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BoardRoutePath get currentConfiguration {
    if (_mode == 'details') {
      return BoardRoutePath.details(_selectedTaskId);
    }

    if (_mode == 'list') {
      return BoardRoutePath.home();
    }

    if (_mode == 'create') {
      return BoardRoutePath.create();
    }

    return BoardRoutePath.notFound();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BoardHomeScreen'),
          child: BoardHomeScreen(),
        ),
        if (_mode == 'create')
          const MaterialPage(
            key: ValueKey('TasksCreateScreen'),
            child: TasksCreateScreen(),
          ),
        if (_mode == 'details')
          MaterialPage(child: TasksDetailScreen(id: _selectedTaskId!)),
        if (_mode == 'not-found')
          const MaterialPage(
            key: ValueKey('NotFoundScreen'),
            child: NotFoundScreen(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedTaskId = null;
        _mode = 'list';
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BoardRoutePath configuration) async {
    if (configuration.isHomePage) {
      _mode = 'list';
      _selectedTaskId = null;
      return;
    }

    if (configuration.isDetailsPage) {
      _mode = 'details';
      _selectedTaskId = configuration.id;
      return;
    }

    if (configuration.isCreatePage) {
      _mode = 'create';
      _selectedTaskId = null;
      return;
    }

    _selectedTaskId = null;
    _mode = 'not-found';
    notifyListeners();
  }

  void setModeToDetails(String taskId) {
    _mode = 'details';
    _selectedTaskId = taskId;
    notifyListeners();
  }

  void setModeToCreate() {
    _mode = 'create';
    notifyListeners();
  }
}
