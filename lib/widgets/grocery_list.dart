import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Icon(
              Icons.square,
              color: groceryItems[index].category!.color,
            ),
            title: Text(groceryItems[index].name),
            trailing: Text(groceryItems[index].quantity.toString()),
          );
        },
      ),
    );
  }
}
