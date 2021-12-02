import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:board/viewmodels/bottom_tab_change_notifier.dart';

final tabProvider = StateNotifierProvider<BottomTabChangeNotifier, int>(
  (ref) => BottomTabChangeNotifier(),
);
