import 'package:flutter/material.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_create/components/add_item_button.dart';
import 'package:recipe_book/view/recipe_create/components/remove_item_button.dart';

class IngredientInputField extends StatefulWidget {
  final List<Ingredient> contentToUpdate;
  final String valueKey;

  const IngredientInputField({
    super.key,
    required this.contentToUpdate,
    required this.valueKey,
  });

  @override
  State<IngredientInputField> createState() => _IngredientInputFieldState();
}

class _IngredientInputFieldState extends State<IngredientInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ingredientAndValueInputsList(),
        AddItemButton(
          addItem: () {
            setState(() {
              widget.contentToUpdate
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
      children: widget.contentToUpdate.map((item) {
        int index = widget.contentToUpdate.indexOf(item);
        return Row(
          children: [
            Expanded(child: _ingredientAndValueInputFieldsRow(index)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: RemoveItemButton(removeItem: () {
                setState(() {
                  widget.contentToUpdate.removeAt(index);
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
            key: ValueKey(widget.valueKey),
            validator: (value) => _validateValue(value),
            onChanged: (value) {
              widget.contentToUpdate[index].ingredient = value;
            },
            decoration: const InputDecoration(
                hintText: RecipeBookStrings.addIngredientHint),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Expanded(
          child: TextFormField(
            key: ValueKey(widget.valueKey),
            validator: (value) => _validateValue(value),
            onChanged: (value) {
              widget.contentToUpdate[index].amount = value;
            },
            decoration:
                const InputDecoration(hintText: RecipeBookStrings.amountString),
          ),
        ),
      ],
    );
  }

  String? _validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return RecipeBookStrings.mustAddAtLeastOneIngredient;
    }
    return null;
  }
}
