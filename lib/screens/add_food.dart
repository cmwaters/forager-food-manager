import 'package:flutter/material.dart';

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFoodPage> {
  bool _isClicked = false;
  int _foodCounter = 0;
  var foods = ['Apples', 'Bananas', 'Carrots', 'Oranges', 'Pears'];

  void _incrementFoodCounter() {
    setState(() {
      _foodCounter++;
    });
  }

  var choice = [];

  var clicked = [false, false, false, false, false];

  void _handleTap(int index) {
    setState(() {
      clicked[index] = !clicked[index];
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
              Navigator.pop(context, choice);
            },
          )
        ],
      ),
      body: GridView.builder(
        itemCount: foods.length.toInt(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text(foods[index]),
                decoration: BoxDecoration(
                  color: clicked[index] ? Colors.black12 : Colors.white,
                ),
              ),
            ),
            onTap: () {
              _handleTap(index);
              choice.contains(foods[index]) ? choice.remove(foods[index]) : choice.add(foods[index]);
            },
          );
        }
      ),
    );
  }
}