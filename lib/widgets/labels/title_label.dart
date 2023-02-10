import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String title;
  final int maxRows;

  const TitleLabel({
    super.key,
    required this.title,
    required this.maxRows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxRows,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}