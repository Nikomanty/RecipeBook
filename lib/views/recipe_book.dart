import 'package:flutter/material.dart';
import 'package:recipe_book/data/recipe_data_source.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/views/recipe_list/recipe_list.dart';

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
        centerTitle: true,
        actions: [_createRoundedButton()],
      ),
      body: RecipeList(recipes: recipes,),
    );
  }

  Widget _createRoundedButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
        child: const Icon(Icons.add),
        //TODO: Create recipe functionality needs to be added
        onPressed: () => debugPrint("Open create recipe"),
      ),
    );
  }
}
