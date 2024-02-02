import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/issue.dart';
import 'issue_controller.dart';
import 'label_search_controller.dart';

class FilteredIssuesController extends StateNotifier<List<Issue>> {
  final List<Issue> _issues;
  final List<Label> _labels;
  FilteredIssuesController({
    required List<Issue> issues,
    required List<Label> labels,
  })  : _issues = issues,
        _labels = labels,
        super([]);

  List<Issue> getFilteredIssues() {
    List<Issue> filteredIssues;
    if (_labels.isNotEmpty) {
      filteredIssues = _issues.where((issue) {
        return issue.labels.any((issueLabel) {
          return _labels
              .any((filterLabel) => issueLabel.name == filterLabel.name);
        });
      }).toList();
    } else {
      filteredIssues = _issues;
    }
    return filteredIssues;
  }

  List<Issue> get issues => state;
}

// -----------------------------------------------------------------------------

final filteredIssuesControllerProvider =
    StateNotifierProvider<FilteredIssuesController, List<Issue>>((ref) {
  final issues = ref.watch(issuesControllerProvider);
  final labels = ref.watch(labelSearchControllerProvider);
  return FilteredIssuesController(
    issues: issues,
    labels: labels,
  );
});
