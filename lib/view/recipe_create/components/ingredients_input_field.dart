import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/view/recipe_create/components/add_item_button.dart';
import 'package:recipe_book/view/recipe_create/components/remove_item_button.dart';

class IngredientInputField extends StatefulWidget {
  final List<Ingredient> ingredients;

  const IngredientInputField({
    super.key,
    required this.ingredients,
  });

  @override
  State<IngredientInputField> createState() => _IngredientInputFieldState();
}

class _IngredientInputFieldState extends State<IngredientInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ingredientAndValueInputsList(),
        AddItemButton(
          addItem: () {
            setState(() {
              widget.ingredients
                  .add(Ingredient(ingredient: "", amount: ""));
            });
          },
          title: RecipeBookStrings.addIngredientButtonText,
        )
      ],
    );
  }

  Column _ingredientAndValueInputsList() {
    return Column(
      children: widget.ingredients.map((item) {
        int index = widget.ingredients.indexOf(item);
        return Row(
          children: [
            Expanded(child: _ingredientAndValueInputFieldsRow(index)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: RemoveItemButton(removeItem: () {
                setState(() {
                  widget.ingredients.removeAt(index);
                });
              }),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _ingredientAndValueInputFieldsRow(int index) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              widget.ingredients[index].ingredient = value;
            },
            decoration: const InputDecoration(
                hintText: RecipeBookStrings.addIngredientHint),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              widget.ingredients[index].amount = value;
            },
            decoration:
                const InputDecoration(hintText: RecipeBookStrings.amountString),
          ),
        ),
      ],
    );
  }
}
