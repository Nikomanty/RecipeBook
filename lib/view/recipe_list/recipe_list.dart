import 'package:flutter/material.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/view/recipe_list/recipe_card.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      padding: const EdgeInsets.only(bottom: 100, top: 5, left: 5, right: 5),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: RecipeCard(
            recipe: recipes[index],
          ),
        );
      },
    );
  }
}
