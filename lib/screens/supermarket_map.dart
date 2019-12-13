import 'package:flutter/material.dart';
import 'shopping_list.dart';
import 'package:forager/model/item.dart';

class SupermarketMap extends StatefulWidget {
  SupermarketMap({Key key}) : super(key: key);

  @override
  _SupermarketMapState createState() => _SupermarketMapState();
}

class _SupermarketMapState extends State<SupermarketMap> {
  List<Item> shopping_list = [
    Item(
        id: 'ghbjdsckvl1',
        name: 'Sushi',
        expiryDate: new DateTime.now().add(new Duration(days: 40)),
        locationX: 17.151227678571427,
        locationY: 552.6339285714286)
  ];
  List<Item> bought_items = new List();
  int itemCount = 0;
  double positionX = 0.0;
  double positionY = 110.01339285714286;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Time to shop'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingListPage()));
              },
            )
          ],
        ),
        body: GestureDetector(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/map.jpg',
                key: new GlobalKey(),
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
              for (var item in shopping_list) Positioned(
                bottom: positionY,
                left: positionX,
                child: Icon(Icons.location_on, size: 60, color: Colors.lightGreen,),
              ),
            ],
          ),
          onTap: () => print("tapped!"),
          onTapDown: (TapDownDetails details) => _onTapDown(details),
        ));
  }

  _onTapDown(TapDownDetails details) {
    Item currentItem = shopping_list.elementAt(itemCount);
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    print("tap down " + x.toString() + ", " + y.toString());
    print("${(x.abs() - currentItem.locationX) * (x.abs() - currentItem.locationX) +
        (y.abs() - currentItem.locationY) * (y.abs() - currentItem.locationY)}");
    if ((x.abs() - currentItem.locationX) * (x.abs() - currentItem.locationX) +
            (y.abs() - currentItem.locationY) * (y.abs() - currentItem.locationY) <=
        1100) {
      _showDialog(currentItem);
    }
  }

  void _showDialog(Item currentItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Add to your fridge?"),
            content: new Text(currentItem.name),
            actions: <Widget>[
              new FlatButton(
                  child: new Text("ADD"),
                  onPressed: () {
                    setState(() {
                      bought_items.add(shopping_list.elementAt(itemCount));
                      shopping_list.removeAt(itemCount);
                      itemCount++;
                    });
                    Navigator.of(context).pop();
                  })
            ]);
      },
    );
  }
}
