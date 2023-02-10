import 'dart:io';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double aspectRatio;

  const RoundedImage({
    Key? key,
    required this.imagePath,
    this.height,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        height: height,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: FileImage(File(imagePath)),
              fit: BoxFit.fitWidth,
            )),
      ),
    );
  }
}
