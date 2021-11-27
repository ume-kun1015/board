import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/router/book_router_delegate.dart';

final bookRouteDelegateProvider = ChangeNotifierProvider(
  (ref) => BookRouterDelegate(),
);
