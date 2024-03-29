import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/utils/navigation_utils.dart';
import 'package:recipe_book/view/recipe_details/recipe_details.dart';
import 'package:recipe_book/widgets/buttons/delete_button.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';
import 'package:recipe_book/widgets/labels/icon_label.dart';
import 'package:recipe_book/widgets/labels/title_label.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          NavigationUtils.navigateToView(
            context,
            RecipeDetails(
              recipe: recipe,
            ),
          ),
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
        RoundedImage(
          imagePath: recipe.image,
          aspectRatio: 1,
          borderRadius: 90,
          height: 80,
          width: 80,
          boxFit: BoxFit.cover,
          placeholderImage: Icons.menu_book,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleLabel(title: recipe.recipeName),
                    if (recipe.duration > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: IconLabel(
                          icon: Icons.timer_outlined,
                          label:
                          "${recipe.duration} ${RecipeBookStrings
                              .minutesString}",
                        ),
                      ),
                  ],
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
}
