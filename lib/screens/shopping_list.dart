import 'package:flutter/material.dart';

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
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementItemCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}