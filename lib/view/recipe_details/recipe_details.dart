import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/view/recipe_details/recipe_ingredient_list.dart';
import 'package:recipe_book/view/recipe_details/recipe_introductions.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';
import 'package:recipe_book/widgets/labels/icon_label.dart';
import 'package:recipe_book/widgets/labels/title_label.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          RoundedImage(
            imagePath: recipe.image,
            height: 300,
            placeholderImage: Icons.menu_book,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          TitleLabel(
            title: recipe.recipeName,
            maxRows: 2,
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          IconLabel(
            icon: Icons.timer_outlined,
            label: "${recipe.duration} ${RecipeBookStrings.minutesString}",
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          _detailsDivider(),
          RecipeIngredientList(ingredients: recipe.ingredients),
          _detailsDivider(),
          RecipeIntroductions(introductions: recipe.introductions),
        ],
      ),
    );
  }

  Widget _detailsDivider() {
    return const Divider(
      height: 20,
      thickness: 0.5,
      color: Colors.black,
    );
  }
}
