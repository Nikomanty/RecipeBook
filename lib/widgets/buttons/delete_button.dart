import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final String? itemToDeleteName;
  final double? iconSize;
  final VoidCallback deleteItem;

  const DeleteButton({
    super.key,
    this.itemToDeleteName,
    this.iconSize,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete, size: iconSize ?? 25),
      onPressed: () {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) {
            return _dialog(context);
          },
        );
      },
    );
  }

  AlertDialog _dialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete $itemToDeleteName?",
      ),
      actions: [
        TextButton(
          onPressed: () {
            deleteItem();
            Navigator.of(context).pop();
          },
          child: const Text("Confirm"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}