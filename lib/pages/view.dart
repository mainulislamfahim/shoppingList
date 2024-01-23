import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/controller/controller.dart';
import 'package:shopping_list/main.dart';
import 'package:shopping_list/model/model.dart';
import 'package:shopping_list/pages/addShoppingLIst.dart';
import 'package:shopping_list/pages/updateDialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = Theme.of(context).textTheme;
    final shoppinglists = ref.watch(shoppinglistProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newShoppingList = await showDialog<String>(
              context: context,
              builder: (context) {
                return const AddShoppingListDialog();
              });
          if (newShoppingList != null && shoppinglists.isNotEmpty) {
            ref.watch(shoppinglistProvider.notifier).add(newShoppingList);
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Center(
        child: Column(
          children: shoppinglists
              .map(
                (shoppinglist) => Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                    title: Text(
                      shoppinglist.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        ref
                            .read(shoppinglistProvider.notifier)
                            .remove(shoppinglist);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    onLongPress: () async {
                      final updatedTask = await showDialog<String>(
                        context: context,
                        builder: (context) {
                          return UpdateDialog(
                            shoppinglist: shoppinglist,
                          );
                        },
                      );

                      if (updatedTask != null && updatedTask.isNotEmpty) {
                        ref
                            .read(shoppinglistProvider.notifier)
                            .update(shoppinglist, updatedTask);
                      }
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
