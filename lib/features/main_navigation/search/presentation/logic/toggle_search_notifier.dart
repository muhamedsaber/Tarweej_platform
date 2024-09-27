import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleSearchNotifier extends StateNotifier<bool> {
  ToggleSearchNotifier() : super(false);

  void toggleSearch() {
  log('Current state: $state'); // Check if the state is toggled
  state = !state;
}
}

final toggleSearchProvider = StateNotifierProvider<ToggleSearchNotifier, bool>(
  (ref) => ToggleSearchNotifier(),
);