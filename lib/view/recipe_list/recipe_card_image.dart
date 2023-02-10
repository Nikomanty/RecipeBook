import 'package:flutter/material.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';

class RecipeCardImage extends StatelessWidget {
  final String? imagePath;

  const RecipeCardImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return RoundedImage(
        imagePath: imagePath!,
        aspectRatio: 1,
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Center(
            child: Icon(
          Icons.menu_book_outlined,
          size: 50,
        )),
      );
    }
  }
}
