import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_details/recipe_details.dart';
import 'package:recipe_book/view/recipe_list/recipe_card_image.dart';
import 'package:recipe_book/widgets/buttons/delete_button.dart';
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
        margin: const EdgeInsets.all(5),
        height: 80,
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
    return Row(
      children: [
        Expanded(
          child: RecipeCardImage(imagePath: recipe.image),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleLabel(title: recipe.recipeName, maxRows: 1),
                      if (recipe.duration > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: IconLabel(
                            icon: Icons.timer_outlined,
                            label:
                                "${recipe.duration} ${RecipeBookStrings.minutesString}",
                          ),
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
        ),
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
