import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class Grocery extends StatelessWidget {
  const Grocery({super.key, required this.groceryItem});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(groceryItem.quantity.toString()),
    );
  }
}
