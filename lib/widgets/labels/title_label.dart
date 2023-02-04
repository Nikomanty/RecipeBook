import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String title;
  final int maxRows;

  const TitleLabel({
    Key? key,
    required this.title,
    required this.maxRows,
  }) : super(key: key);

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