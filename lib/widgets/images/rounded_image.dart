import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double? height;

  const RoundedImage({
    Key? key,
    required this.imagePath,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          )),
    );
  }
}
