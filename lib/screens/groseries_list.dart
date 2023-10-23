import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/grocery.dart';

class GroseriesList extends StatelessWidget {
  const GroseriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Groceries')),
      body: Center(
        child: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) {
            return Grocery(
              groceryItem: groceryItems[index],
            );
          },
        ),
      ),
    );
  }
}
