import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final MainAxisAlignment? mainAxisAlignment;

  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey.shade800,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
        )
      ],
    );
  }
}
