import 'package:flutter/material.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
