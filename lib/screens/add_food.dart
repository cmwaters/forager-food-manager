import 'package:flutter/material.dart';

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFoodPage> {
  int _foodCounter = 0;
  var foods = ['Apples', 'Bananas', 'Carrots', 'Oranges', 'Pears'];

  void _incrementFoodCounter() {
    setState(() {
      _foodCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Food"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: GridView.builder(
        itemCount: foods.length.toInt(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text(foods[index]),
              ),
            ),
            onTap: () {
              showDialog(
                child: Text("hi")
              );
            },
          );
        }
      ),
    );
  }
}