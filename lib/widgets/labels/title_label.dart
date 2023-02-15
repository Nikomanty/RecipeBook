import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String title;
  final int maxRows;
  final TextAlign? textAlign;

  const TitleLabel({
    super.key,
    required this.title,
    this.maxRows = 1,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxRows,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}