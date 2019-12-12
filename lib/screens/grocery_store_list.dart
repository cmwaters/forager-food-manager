import 'package:flutter/material.dart';
import 'package:forager/screens/supermarket_map.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Supermarket"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SupermarketMap()));
            },
          )
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('RUnnnnnnnn!'),
        ),
      ),
    );
  }
}