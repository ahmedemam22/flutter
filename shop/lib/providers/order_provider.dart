import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_item.dart';
import 'package:http/http.dart' as http;


class Order{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  Order({this.id,this.amount,this.products,this.dateTime});
}
class OrderProvider with ChangeNotifier{
  List<Order>_items=[];
  final String authToken;
  final String userId;
  OrderProvider(this.authToken, this._items,this.userId);

  List<Order> get items{
    return _items;

  }
  Future<void> fetchAndSetOrders() async {
    final url = 'https://fir-1-85c31.firebaseio.com/orders/$userId.json?auth=$authToken';

    final response = await http.get(url);
    final List<Order> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        Order(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
              id: item['id'],
              price: item['price'],
              quantity: item['quantity'],
              title: item['title'],
            ),
          )
              .toList(),
        ),
      );
    });
    _items = loadedOrders.reversed.toList();//34an tgbly mn gded ll2adem
    notifyListeners();
  }
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = 'https://fir-1-85c31.firebaseio.com/orders/$userId.json?auth=$authToken';
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
          'id': cp.id,
          'title': cp.title,
          'quantity': cp.quantity,
          'price': cp.price,
        })
            .toList(),
      }),
    );
    _items.insert(
      0,
      Order(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
  void clear(){
    _items.clear();
    notifyListeners();
  }
  

}