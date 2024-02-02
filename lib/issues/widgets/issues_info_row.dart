import 'package:flutter/material.dart';

class IssueInfoRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  const IssueInfoRow({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            firstText,
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            secondText,
          ),
        ),
      ],
    );
  }
}
