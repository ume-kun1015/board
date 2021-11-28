import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/router/board_router_delegate.dart';

final boardRouteDelegateProvider = ChangeNotifierProvider(
  (ref) => BoardRouterDelegate(),
);
