import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTabChangeNotifier extends StateNotifier<int> {
  BottomTabChangeNotifier() : super(_initialTab);

  static const _initialTab = 0;

  void changeTab(int tapped) {
    state = tapped;
  }
}
