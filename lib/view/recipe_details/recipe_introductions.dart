import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/widgets/containers/titled_outline_box.dart';

class RecipeIntroductions extends StatelessWidget {
  final List<String> introductions;

  const RecipeIntroductions({
    super.key,
    required this.introductions,
  });

  @override
  Widget build(BuildContext context) {
    if (introductions.isNotEmpty) {
      return TitledOutlineBox(
        label: "Introductions",
        content: Column(
          children: introductions.map((introduction) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${introductions.indexOf(introduction) + 1}. ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Flexible(child: Text(introduction)),
                ],
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return const Center(
        child: Text(
          RecipeBookStrings.noIntroductionsFound,
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}