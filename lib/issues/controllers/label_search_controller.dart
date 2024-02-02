import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/issue.dart';

class LabelSearchController extends StateNotifier<List<Label>> {
  LabelSearchController() : super([]);

  void addOrRemoveLabel({required Label label}) {
    if (state.any((element) => element.name == label.name)) {
      state.removeWhere((element) => element.name == label.name);
      final newState = state;
      state = [...newState];
    } else {
      state = [...state, label];
    }
  }
}

// -----------------------------------------------------------------------------

final labelSearchControllerProvider =
    StateNotifierProvider<LabelSearchController, List<Label>>((ref) {
  return LabelSearchController();
});
