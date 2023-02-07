import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final String? itemToDeleteName;
  final double? iconSize;
  final Function() deleteItem;

  const DeleteButton({
    Key? key,
    this.itemToDeleteName,
    this.iconSize,
    required this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete, size: iconSize ?? 25),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _dialog(context);
          },
        );
      },
    );
  }

  _dialog(BuildContext context) {
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