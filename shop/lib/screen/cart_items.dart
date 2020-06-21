import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
class Item extends StatelessWidget {
  String id;
  String productKey;
  double price;
  int quantity;
  String title;
 Item(this.productKey,this.id,this.price,this.quantity,this.title);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,

        child: Icon(Icons.delete,color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),

      direction:DismissDirection.endToStart,
      confirmDismiss: (direction) {//w hwa bys7b lsa ma5tft4 lw rg4t true ttft false mt5tfy4
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction){//b3d l-25tfa2
        Provider.of<CartProvider>(context,listen: false).removeItem(productKey);


      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(child: FittedBox(child: Text("\$$price")),),
          title: Text("$title"),
          subtitle: Text("Total:\$${(price * quantity)}"),
          trailing: Text("${quantity}x"),
        ),
      ),
    );
  }
}
