import 'package:flutter/material.dart';

import 'package:board/screens/tasks/tasks_detail.dart';
import 'package:board/screens/board_home_screen.dart';
import 'package:board/router/book_route_path.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  String? _selectedBookId;
  bool show404 = false;

  get selectedBookId => _selectedBookId;

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }

    return _selectedBookId == null
        ? BookRoutePath.home()
        : BookRoutePath.details(_selectedBookId);
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
        // if (show404)
        //   MaterialPage(
        //       key: const ValueKey('UnknownPage'), child: UnknownScreen())
        if (_selectedBookId != null)
          MaterialPage(child: TasksDetailScreen(id: _selectedBookId!)),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedBookId = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBookId = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      _selectedBookId = path.id;
    } else {
      _selectedBookId = null;
    }

    show404 = false;
  }

  void handleBookTapped(String taskId) {
    _selectedBookId = taskId;
    notifyListeners();
  }
}
