import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/issue.dart';
import '../controllers/issue_controller.dart';
import 'labels_bar.dart';
import 'main_content.dart';

class IssuesList extends ConsumerWidget {
  const IssuesList({
    super.key,
    required this.issuesController,
  });

  final List<Issue> issuesController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: issuesController.length + 1,
        itemBuilder: (context, index) {
          if (index < issuesController.length) {
            Issue issue = issuesController[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    MainContent(issue: issue),
                    LabelsBar(issue: issue)
                  ],
                ),
              ),
            );
          } else if (index == issuesController.length &&
              issuesController.isNotEmpty) {
            ref.read(issuesControllerProvider.notifier).fetchNextPage();
            return const SizedBox(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
