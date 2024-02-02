import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/issue_controller.dart';
import 'issues_screen.dart';

class InitializationScreen extends ConsumerStatefulWidget {
  const InitializationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InitializationViewState();
}

class _InitializationViewState extends ConsumerState<InitializationScreen> {
  @override
  void initState() {
    ref
        .read(issuesControllerProvider.notifier)
        .fetchNextPage()
        .whenComplete(() {
      // ref.read(filteredIssuesControllerProvider.notifier).getFilteredIssues();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const IssuesView(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
