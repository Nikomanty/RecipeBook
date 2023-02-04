import 'package:flutter/material.dart';
import 'package:recipe_book/data/recipe_data_source.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_list/recipe_list.dart';
import 'package:recipe_book/widgets/buttons/action_button.dart';

class RecipeBook extends StatelessWidget {
  final List<Recipe> recipes = RecipeDummyDataSource.recipes;

  RecipeBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          RecipeBookStrings.recipesString,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          ActionButton(
            action: () => debugPrint("Create new recipe"),
            title: "+",
          )
        ],
      ),
      body: RecipeList(
        recipes: recipes,
      ),
    );
  }
}
