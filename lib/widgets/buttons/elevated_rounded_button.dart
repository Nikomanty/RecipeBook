import 'package:flutter/material.dart';

class ElevatedRoundedButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;
  final Color? elevationColor;
  final Widget content;
  final Function onClick;

  const ElevatedRoundedButton(
      {Key? key, required this.width,
      required this.height,
      required this.radius,
      this.elevationColor,
      required this.color,
      required this.content,
      required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick(),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: elevationColor ?? Colors.grey,
              offset: const Offset(0.0, 1.0),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: content,
      ),
    );
  }
}
