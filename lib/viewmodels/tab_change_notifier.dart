import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabChangeNotifier extends StateNotifier<int> {
  TabChangeNotifier() : super(_initialTab);

  static const _initialTab = 0;

  void changeTab(int tapped) {
    state = tapped;
  }
}
