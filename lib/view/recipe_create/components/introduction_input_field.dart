import 'package:flutter/material.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_create/components/add_item_button.dart';
import 'package:recipe_book/view/recipe_create/components/remove_item_button.dart';

class IntroductionInputField extends StatefulWidget {
  final List<String> contentToUpdate;
  final String valueKey;

  const IntroductionInputField({
    super.key,
    required this.contentToUpdate,
    required this.valueKey,
  });

  @override
  State<IntroductionInputField> createState() => _IntroductionInputFieldState();
}

class _IntroductionInputFieldState extends State<IntroductionInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _introductionInputsList(),
        AddItemButton(
          addItem: () {
            setState(() {
              widget.contentToUpdate.add("");
            });
          },
          title: RecipeBookStrings.addIntroductionStepButtonText,
        )
      ],
    );
  }

  Column _introductionInputsList() {
    return Column(
      children: widget.contentToUpdate.map((item) {
        int index = widget.contentToUpdate.indexOf(item);
        return Row(
          children: [
            _introductionInputField(index),
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

  Widget _introductionInputField(int index) {
    return Expanded(
      child: TextFormField(
        key: ValueKey(widget.valueKey),
        onChanged: (value) {
          widget.contentToUpdate[index] = value;
        },
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
            hintText: RecipeBookStrings.addIntroductionsHint),
      ),
    );
  }
}
