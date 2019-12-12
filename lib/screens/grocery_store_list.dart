import 'package:flutter/material.dart';
import 'package:forager/screens/supermarket_map.dart';

class StorePage extends StatelessWidget {

  var stores = [['Rewe','Turmstraße 32'], ['Netto','Sonnenallee 45'], ['Lidl', 'Weberstraße 7']];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Supermarket"),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.arrow_forward),
//            onPressed: () {
//              Navigator.push(context, );
//            },
//          )
//        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => SupermarketMap()));
            },
            child: Card(
              child:ListTile(
                leading: Icon(Icons.store),
                title: Text(
                  stores[index][0],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  stores[index][1],
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
            )
          );
        },
      ),
    );
  }
}