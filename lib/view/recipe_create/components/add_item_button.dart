import 'package:flutter/material.dart';
import 'package:recipe_book/widgets/buttons/elevated_rounded_button.dart';

class AddItemButton extends StatelessWidget {
  final VoidCallback addItem;
  final String title;

  const AddItemButton({
    super.key,
    required this.addItem,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedRoundedButton(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 35,
        radius: 5,
        color: Colors.white,
        content: Center(child: Text(title)),
        onClick: () => addItem(),
      ),
    );
  }
}
