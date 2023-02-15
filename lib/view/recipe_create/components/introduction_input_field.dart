import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_create/components/add_item_button.dart';
import 'package:recipe_book/view/recipe_create/components/remove_item_button.dart';

class IntroductionInputField extends StatefulWidget {
  final List<String> introductions;

  const IntroductionInputField({
    super.key,
    required this.introductions,
  });

  @override
  State<IntroductionInputField> createState() => _IntroductionInputFieldState();
}

class _IntroductionInputFieldState extends State<IntroductionInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _introductionInputsList(),
        AddItemButton(
          addItem: () {
            setState(() {
              widget.introductions.add("");
            });
          },
          title: RecipeBookStrings.addIntroductionStepButtonText,
        )
      ],
    );
  }

  Column _introductionInputsList() {
    return Column(
      children: widget.introductions.map((item) {
        int index = widget.introductions.indexOf(item);
        return Row(
          children: [
            Expanded(child: _introductionInputField(index)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: RemoveItemButton(removeItem: () {
                setState(() {
                  widget.introductions.removeAt(index);
                });
              }),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _introductionInputField(int index) {
    return TextFormField(
      onChanged: (value) {
        widget.introductions[index] = value;
      },
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: const InputDecoration(
          hintText: RecipeBookStrings.addIntroductionsHint),
    );
  }
}
