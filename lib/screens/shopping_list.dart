import 'package:flutter/material.dart';
import 'add_food.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingListPage> {
  int _itemsCount = 0;

  void _incrementItemCounter() {
    setState(() {
      _itemsCount++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Center(
        child: Text("Hello World")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFoodPage()));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}