import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/model/model.dart';

final shoppinglistProvider =
    StateNotifierProvider<ShoppinglistNotifier, List<shoppingList>>(
        (ref) => ShoppinglistNotifier());

class ShoppinglistNotifier extends StateNotifier<List<shoppingList>> {
  ShoppinglistNotifier() : super([shoppingList('Egg')]);

  void add(String title) {
    state = [...state, shoppingList(title)];
  }

  void remove(shoppingList task) {
    state = [...state.where((element) => element != task)];
  }

  void update(shoppingList task, String updateTitle) {
    final updateList = <shoppingList>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == task) {
        updateList.add(
          shoppingList(updateTitle),
        );
      } else {
        updateList.add(state[i]);
      }
      state = updateList;
    }
  }
}
