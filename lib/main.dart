import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'issues/screens/initialization_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: FlutterIssuesApp()),
  );
}

class FlutterIssuesApp extends StatelessWidget {
  const FlutterIssuesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter\'s Github Issues',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitializationScreen(),
    );
  }
}
