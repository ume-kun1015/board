import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/viewmodels/tab_change_notifier.dart';

final tabProvider =
    StateNotifierProvider<TabChangeNotifier, int>((ref) => TabChangeNotifier());
