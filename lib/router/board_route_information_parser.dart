import 'package:flutter/material.dart';

import 'package:board/router/board_route_path.dart';

class BoardRouteInformationParser
    extends RouteInformationParser<BoardRoutePath> {
  @override
  Future<BoardRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) {
      return BoardRoutePath.home();
    }

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'tasks') {
        return BoardRoutePath.notFound();
      }

      final taskId = uri.pathSegments[1];
      if (taskId == 'create') {
        BoardRoutePath.create();
      }

      return BoardRoutePath.details(taskId);
    }

    return BoardRoutePath.notFound();
  }

  @override
  RouteInformation? restoreRouteInformation(BoardRoutePath configuration) {
    if (configuration.isNotFound) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: '/tasks/${configuration.id}');
    }
    if (configuration.isCreatePage) {
      return const RouteInformation(location: '/tasks/create');
    }

    return null;
  }
}
