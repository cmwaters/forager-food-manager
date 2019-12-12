import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forager/model/item.dart';


class FridgeItem extends StatelessWidget {
  final List<Item> itemsList;
  final Function(int, String) handleItem;
  FridgeItem({Key key, this.itemsList, this.handleItem}): super(key: key);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
     child: Dismissible(
         key: Key(itemsList[index].id),
        child: InkWell(
              onTap: (){
                handleItem(index, "selectDate");
              },
              onLongPress: (){

              },
              child: ListTile(
                leading: Icon(Icons.fastfood),
                title: Text(
                  itemsList[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('expiry date: ${itemsList[index].expiryDate.day}.${itemsList[index].expiryDate.month}.',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontStyle: FontStyle.italic,)),
              ),
        ),
        onDismissed: (DismissDirection dir){
           if(dir==DismissDirection.startToEnd){
             handleItem(index, "delete");
           } else handleItem(index, "delete");
          Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir!= DismissDirection.startToEnd
                    ? 'moved item to shopping list'
                    : 'deleted item'),
              )
          );
        },
       background: Container(
         color: Colors.green,
         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
           child:Icon(Icons.remove),
         ),
         alignment: Alignment.centerLeft,
       ),
       secondaryBackground: Container(
         color: Colors.blue,
         child: Padding(
           padding: EdgeInsets.symmetric( vertical: 0.0 , horizontal: 20),
           child: Icon(Icons.add_shopping_cart),
         ),
         alignment: Alignment.centerRight,
       ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: _buildProductItem,
      itemCount: itemsList.length,
    );
  }
}
