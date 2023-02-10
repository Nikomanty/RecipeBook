import 'package:flutter/material.dart';
import 'package:recipe_book/widgets/buttons/elevated_rounded_button.dart';

class AddItemButton extends StatelessWidget {
  final Function() addItem;
  final String title;

  const AddItemButton({
    Key? key,
    required this.addItem,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: ElevatedRoundedButton(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 35,
          radius: 5,
          color: Colors.white,
          content: Center(child: Text(title)),
          onClick: () => addItem(),
        ),
      ),
    );
  }
}
