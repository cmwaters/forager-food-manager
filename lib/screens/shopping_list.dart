import 'package:flutter/material.dart';
import 'package:forager/screens/grocery_store_list.dart';
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

  var choice = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StorePage()));
            },
          )
        ],
      ),
      body: GridView.builder(
          itemCount: choice.length.toInt(),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              child: new Card(
                elevation: 5.0,
                child: new Container(
                  alignment: Alignment.center,
                  child: new Text(choice[index]),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Icon(Icons.add)
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => AddFoodPage()),
    );

    setState(() {
      choice = result;
    });
  }
}