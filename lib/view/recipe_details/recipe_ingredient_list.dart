import 'package:flutter/material.dart';
import 'package:recipe_book/model/recipe.dart';

class RecipeIngredientList extends StatelessWidget {
  final Map<String, dynamic> ingredients;

  const RecipeIngredientList({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients.entries.map((ingredient) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                ingredient.value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
              Expanded(
                flex: 6,
                child: Text.rich(TextSpan(text: ingredient.key)),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
