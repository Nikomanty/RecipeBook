import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String title;
  final int maxRows;
  final bool centered;

  const TitleLabel({
    super.key,
    required this.title,
    required this.maxRows,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: centered ? TextAlign.center : TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxRows,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}