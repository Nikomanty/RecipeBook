import 'package:flutter/material.dart';

class RemoveItemButton extends StatelessWidget {
  final VoidCallback removeItem;

  const RemoveItemButton({super.key, required this.removeItem});

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
