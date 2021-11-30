import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/providers/board_route_delegate_provider.dart';
import 'package:board/router/board_route_information_parser.dart';
import 'package:board/infra/sqlite/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqliteClient().initDatabase();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(boardRouteDelegateProvider);

    return MaterialApp.router(
      title: 'Board App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routerDelegate: provider,
      routeInformationParser: BoardRouteInformationParser(),
    );
  }
}
