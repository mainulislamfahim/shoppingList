import 'package:flutter/material.dart';
import 'package:shopping_list/model/model.dart';

class UpdateDialog extends StatefulWidget {
  final shoppingList shoppinglist;
  const UpdateDialog({super.key, required this.shoppinglist});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController =
        TextEditingController(text: widget.shoppinglist.title);
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
      title: const Text("Update List"),
      content: TextField(
        controller: textEditingController,
        onChanged: (value) {},
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(textEditingController.text);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
