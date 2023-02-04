import 'package:flutter/material.dart';
import 'package:recipe_book/model/recipe.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          //TODO: Add real card widget for recipes
          child: ListTile(
            title: Text(
              "Recipe name: ${recipes[index].recipeName}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              "Duration: ${recipes[index].duration}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            tileColor: Colors.grey,
          ),
        );
      },
    );
  }
}
