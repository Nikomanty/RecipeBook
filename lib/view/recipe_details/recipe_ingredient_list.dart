import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/model/recipe.dart';

class RecipeIngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const RecipeIngredientList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    if (ingredients.isNotEmpty) {
      return Column(
        children: ingredients.map((ingredient) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    ingredient.amount,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(
                  flex: 5,
                  child: Text(ingredient.ingredient),
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return const Center(
        child: Text(
          RecipeBookStrings.noIngredientsFound,
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
