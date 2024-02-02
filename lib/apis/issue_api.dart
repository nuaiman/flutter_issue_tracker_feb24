import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/issue.dart';

abstract class IIssueApi {
  Future<List<Issue>> fetchIssues({int page});
}

// -----------------------------------------------------------------------------
class IssuesApi implements IIssueApi {
  @override
  Future<List<Issue>> fetchIssues({int page = 1}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.github.com/repos/flutter/flutter/issues?page=$page&per_page=10'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      List<Issue> issues = [];
      for (var jsonIssue in jsonList) {
        issues.add(Issue.fromJson(jsonIssue));
      }
      return issues;
    } else {
      throw Exception('Failed to load issues');
    }
  }
}

// -----------------------------------------------------------------------------

final issuesApiProvider = Provider<IssuesApi>((ref) {
  return IssuesApi();
});
