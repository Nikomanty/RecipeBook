import 'package:flutter/material.dart';

class TitledOutlineBox extends StatelessWidget {
  final String label;
  final double? labelSize;
  final Widget content;

  const TitledOutlineBox({
    super.key,
    required this.label,
    required this.content,
    this.labelSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 10, right: 10, left: 10),
            child: content,
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(label, style: TextStyle(fontSize: labelSize)),
          ),
        ),
      ],
    );
  }
}
