import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../apis/issue_api.dart';
import '../../model/issue.dart';

class IssueController extends StateNotifier<List<Issue>> {
  final IssuesApi _issuesApi;
  int _currentPage = 1;

  IssueController({required IssuesApi issuesApi})
      : _issuesApi = issuesApi,
        super([]);

  Future<void> fetchNextPage() async {
    List<Issue> newIssues = await _issuesApi.fetchIssues(page: _currentPage);
    if (newIssues.isNotEmpty) {
      _currentPage++;
      state = [...state, ...newIssues];
    }
  }
}

// -----------------------------------------------------------------------------

final issuesControllerProvider =
    StateNotifierProvider<IssueController, List<Issue>>((ref) {
  final issuesApi = ref.read(issuesApiProvider);
  return IssueController(
    issuesApi: issuesApi,
  );
});
