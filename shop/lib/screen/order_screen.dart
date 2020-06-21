import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/order_provider.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    /*Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<OrderProvider>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: Menu(),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<OrderProvider>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.items.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.items[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }}
