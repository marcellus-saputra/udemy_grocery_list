import 'package:flutter/material.dart';
import 'package:udemy_grocery_list/models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  Widget _getGroceriesList() {
    return ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            leading: Icon(
              Icons.square,
              color: _groceryItems[index].category!.color,
            ),
            title: Text(_groceryItems[index].name),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        );
      },
    );
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
      body: _groceryItems.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Groceries',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Add groceries using the + button!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            )
          : _getGroceriesList(),
    );
  }
}
