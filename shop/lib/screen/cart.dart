import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/order_provider.dart';

import 'cart_items.dart';
class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(children: <Widget>[
          Card(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[
              Text("Total"),
              Chip(
                label: Text("\$${cart.total} "),
                backgroundColor: Colors.purple,
              ),
                OrderButton(cart: cart)

              ],),),
          Expanded(
            child: ListView.builder(itemCount: cart.items.length,
              itemBuilder: (BuildContext context, int index) {
              return Item(cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].id,cart.items.values.toList()[index].price,cart.items.values.toList()[index].quantity,cart.items.values.toList()[index].title);

            }, ),
          )
        ]),
      ),
    );
  }

}
class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.total <= 0 || _isLoading)
          ? null
          : () async {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<OrderProvider>(context, listen: false).addOrder(
          widget.cart.items.values.toList(),
          widget.cart.total,
        );
        setState(() {
          _isLoading = false;
        });
        widget.cart.clear();
      },
      textColor: Theme
          .of(context)
          .primaryColor,
    );
  }

}
