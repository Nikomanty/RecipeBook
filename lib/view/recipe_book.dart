import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/utils/navigation_utils.dart';
import 'package:recipe_book/view/recipe_create/recipe_form.dart';
import 'package:recipe_book/view/recipe_list/recipe_list.dart';
import 'package:recipe_book/widgets/errors/centered_error_text.dart';

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          RecipeBookStrings.recipesString,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state.status == RecipeStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == RecipeStatus.error) {
            return CenteredErrorText(errorMessage: state.exception.toString());
          } else {
            List<Recipe> recipes = state.recipes ?? [];
            if (recipes.isNotEmpty) {
              return RecipeList(
                recipes: recipes,
              );
            } else {
              return const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    RecipeBookStrings.cardListNoRecipes,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              );
            }
          }
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            onPressed: () => NavigationUtils.openSelectedRecipe(
              context,
              const RecipeForm(),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
