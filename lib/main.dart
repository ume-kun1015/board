import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/state/book_route_delegate_state.dart';
import 'package:board/router/book_route_information_parser.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(bookRouteDelegateProvider);

    return MaterialApp.router(
      title: 'Board App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routerDelegate: provider,
      routeInformationParser: BookRouteInformationParser(),
    );
  }
}
