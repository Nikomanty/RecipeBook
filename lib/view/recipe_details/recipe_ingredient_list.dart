import 'package:flutter/material.dart';
import 'package:recipe_book/model/recipe.dart';

class RecipeIngredientList extends StatelessWidget {
  final List<dynamic> ingredients;

  const RecipeIngredientList({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ingredients.isNotEmpty) {
      return Column(
        children: ingredients.map((ingredient) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    ingredient['amount'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(
                  flex: 5,
                  child: Text.rich(TextSpan(text: ingredient['ingredient'])),
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return const Center(
        child: Text(
          "No ingredients found",
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
