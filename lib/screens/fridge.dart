import 'package:flutter/material.dart';
import 'package:forager/model/item.dart';
import 'package:forager/widgets/fridge/fridgeListTile.dart';
import 'shopping_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart' as prefix0;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class FridgePage extends StatefulWidget {
  @override
  _FridgePageState createState() => _FridgePageState();

}

class _FridgePageState extends State<FridgePage> {
  static DateTime time= new DateTime.now();
  List<Item> items=[(new Item(id: "5045",name: "milk",expiryDate: time.add((new Duration(days: 60))))),(new Item(id: "5555",name: "eggs",expiryDate: time.add((new Duration(days: 30))))),(new Item(id: "01",name: "water",expiryDate: time.add((new Duration(days: 15))))) ];

  selectDate(BuildContext context){
    return prefix0.Alert(
      context: context,
      title: "select expiry date",
      content: Card(
        child: BasicDateField(),
      ),
      buttons: [
        prefix0.DialogButton(
         child: Text("set date"),
    )
        ]
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fridge"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingListPage()));
            },
          )
        ],
      ),
      body: Builder(
          builder: (context) => Center(
          child: Column(
            children: <Widget>[
              FridgeItem(
                itemsList: items,
                handleItem: (int index, String action){
                  setState(() {
                    if(action=="delete") {
                      items.removeAt(index);
                      for (var x in items) {
                        print(x.name);
                      }
                    }else if(action=="move"){
                      //TODO: add item to shopping list
                      print("add item ${items[index].name} to shopping list");
                    } else if(action=="selectDate"){
                      selectDate(context);
                    }
                  });

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
