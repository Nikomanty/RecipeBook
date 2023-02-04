import 'package:flutter/material.dart';

class RecipeCardImage extends StatelessWidget {
  final String recipeThumpNailImagePath;

  const RecipeCardImage({
    Key? key,
    required this.recipeThumpNailImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(recipeThumpNailImagePath),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
      ),
    );
  }
}