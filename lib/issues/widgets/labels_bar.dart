import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/issue.dart';
import '../controllers/label_search_controller.dart';

class LabelsBar extends ConsumerWidget {
  const LabelsBar({
    super.key,
    required this.issue,
  });

  final Issue issue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: issue.labels.isEmpty ? 0 : 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: issue.labels.length,
        itemBuilder: (context, index) {
          Label label = issue.labels[index];
          var color = '0xFF${label.color}';
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                ref
                    .read(labelSearchControllerProvider.notifier)
                    .addOrRemoveLabel(label: label);
              },
              child: Chip(
                visualDensity: VisualDensity.compact,
                label: Text(label.name),
                backgroundColor: Color(int.parse(color)).withOpacity(0.2),
              ),
            ),
          );
        },
      ),
    );
  }
}
