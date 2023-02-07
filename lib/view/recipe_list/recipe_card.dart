import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_details/recipe_details.dart';
import 'package:recipe_book/widgets/buttons/delete_button.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';
import 'package:recipe_book/widgets/labels/icon_label.dart';
import 'package:recipe_book/widgets/labels/title_label.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openSelectedRecipe(context),
      child: Container(
        height: 180,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              offset: const Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: _cardContent(context),
      ),
    );
  }

  Widget _cardContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleLabel(title: recipe.recipeName, maxRows: 1),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
                    IconLabel(
                      icon: Icons.timer_outlined,
                      label:
                          "${recipe.duration} ${RecipeBookStrings.minutesString}",
                    ),
                  ],
                ),
              ),
              DeleteButton(
                itemToDeleteName: recipe.recipeName,
                iconSize: 35,
                deleteItem: () {
                    context.read<RecipeCubit>().deleteRecipe(recipe.id!);
                },
              ),
            ],
          ),
        ),
        Expanded(child: RoundedImage(imagePath: recipe.image)),
      ],
    );
  }

  _openSelectedRecipe(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: RecipeDetails(
          recipe: recipe,
        ),
      ),
    );
  }
}
