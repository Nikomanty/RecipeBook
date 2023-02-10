import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';

class RecipeImagePicker extends StatelessWidget {
  final String imagePath;
  final VoidCallback updateImage;

  const RecipeImagePicker({
    super.key,
    required this.imagePath,
    required this.updateImage,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty) {
      return InkWell(
        child: RoundedImage(
          imagePath: imagePath,
          height: 300,
          aspectRatio: 4 / 3,
        ),
        onTap: () => updateImage(),
      );
    } else {
      return InkWell(
        child: const Center(child: Text(RecipeBookStrings.clickToAddImage)),
        onTap: () => updateImage(),
      );
    }
  }
}
