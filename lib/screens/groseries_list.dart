import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroseriesList extends StatefulWidget {
  const GroseriesList({super.key});

  @override
  State<GroseriesList> createState() => _GroseriesListState();
}

class _GroseriesListState extends State<GroseriesList> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          ),
        ),
      ),
    );
  }
}
