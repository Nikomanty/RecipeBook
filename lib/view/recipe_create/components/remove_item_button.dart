import 'package:flutter/material.dart';

class RemoveItemButton extends StatelessWidget {
  final Function() removeItem;

  const RemoveItemButton({Key? key, required this.removeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        removeItem();
      },
      icon: const Icon(Icons.delete),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
