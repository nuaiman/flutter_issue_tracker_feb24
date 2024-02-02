import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/issue.dart';
import '../controllers/filtered_issues_controller.dart';
import '../controllers/issue_controller.dart';
import '../controllers/label_search_controller.dart';
import '../widgets/issues_list.dart';

class IssuesView extends ConsumerWidget {
  const IssuesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(issuesControllerProvider);
    final filteredIssues = ref
        .watch(filteredIssuesControllerProvider.notifier)
        .getFilteredIssues();
    final labels = ref.watch(labelSearchControllerProvider);
    // ref.watch(filteredIssuesControllerProvider.notifier).getFilteredIssues();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Issues'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                        child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: labels.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        Label label = labels[index];
                        var color = '0xFF${label.color}';
                        return Chip(
                          onDeleted: () {
                            ref
                                .read(labelSearchControllerProvider.notifier)
                                .addOrRemoveLabel(label: label);
                          },
                          visualDensity: VisualDensity.compact,
                          label: Text(label.name),
                          backgroundColor:
                              Color(int.parse(color)).withOpacity(0.2),
                        );
                      },
                    ))
                  ],
                ),
              ),
            ),
            IssuesList(issuesController: filteredIssues),
          ],
        ),
      ),
    );
  }
}
