import 'package:flutter/material.dart';

class AddShoppingListDialog extends StatefulWidget {
  const AddShoppingListDialog({super.key});

  @override
  State<AddShoppingListDialog> createState() => _AddShoppingListDialogState();
}

class _AddShoppingListDialogState extends State<AddShoppingListDialog> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add List"),
      content: TextField(
        controller: textEditingController,
        onChanged: (value) {},
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(textEditingController.text);
            },
            child: const Text('Add')),
      ],
    );
  }
}
