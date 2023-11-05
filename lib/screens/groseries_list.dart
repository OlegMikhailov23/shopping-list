import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroseriesList extends StatefulWidget {
  const GroseriesList({super.key});

  @override
  State<GroseriesList> createState() => _GroseriesListState();
}

class _GroseriesListState extends State<GroseriesList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _onRemoveItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    var content = const Center(child: Text('No content yet :('));

    if (_groceryItems.isNotEmpty) {
      content = Center(
        child: ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(_groceryItems[index].id),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(.75),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onDismissed: (direction) => _onRemoveItem(_groceryItems[index]),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(_groceryItems[index].quantity.toString()),
              )),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
