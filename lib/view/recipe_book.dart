import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_list/recipe_list.dart';
import 'package:recipe_book/widgets/buttons/action_button.dart';
import 'package:recipe_book/widgets/errors/centered_error_text.dart';

class RecipeBook extends StatelessWidget {
  const RecipeBook({Key? key}) : super(key: key);

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
            action: () {
              context.read<RecipeCubit>().createRecipe(Recipe(
                  recipeName: "Eka recipe",
                  duration: 100,
                  ingredients: {
                    "Jouhoja": "100g",
                    "Munia": "2kpl",
                    "sokeria": "300g",
                  },
                  introductions: [
                    "Teeppä tuota",
                    "tekase kans tuota",
                    "oha se jännä kakku",
                  ],
                  image: "images/placeholder_image.jpeg"));
            },
            title: "+",
          )
        ],
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state.status == RecipeStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == RecipeStatus.error) {
            return CenteredErrorText(errorMessage: state.exception.toString());
          } else {
            return RecipeList(
              recipes: state.recipes ?? [],
            );
          }
        },
      ),
    );
  }
}
