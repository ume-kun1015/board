import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/router/delegate.dart';

final routeDelegateProvider =
    ChangeNotifierProvider((ref) => MyRouterDelegate());
