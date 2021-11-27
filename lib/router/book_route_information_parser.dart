import 'package:flutter/material.dart';

import 'package:board/router/book_route_path.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.home();
    }

    // Handle '/tasks/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'tasks') return BookRoutePath.unknown();
      final remaining = uri.pathSegments[1];
      return BookRoutePath.details(remaining);
    }

    return BookRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: '/book/${configuration.id}');
    }

    return null;
  }
}
