import 'dart:io';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String? imagePath;
  final IconData placeholderImage;
  final double height;
  final double? width;
  final BoxFit boxFit;
  final double borderRadius;
  final double aspectRatio;

  const RoundedImage({
    super.key,
    required this.imagePath,
    required this.placeholderImage,
    required this.height,
    this.width,
    this.aspectRatio = 4 / 3,
    this.borderRadius = 10,
    this.boxFit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          height: height,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: FileImage(File(imagePath!)),
                fit: boxFit,
              )),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Icon(
            placeholderImage,
            size: height * 0.7,
          ),
        ),
      );
    }
  }
}
