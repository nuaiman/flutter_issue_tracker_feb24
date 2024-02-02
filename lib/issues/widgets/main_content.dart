import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/issue.dart';
import 'issues_info_row.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.issue,
  });

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IssueInfoRow(
            firstText: issue.title,
            secondText: DateFormat('dd-MMM-yyyy').format(issue.createdAt),
          ),
          IssueInfoRow(
            firstText: issue.body,
            secondText: issue.user.login,
          ),
        ],
      ),
    );
  }
}
