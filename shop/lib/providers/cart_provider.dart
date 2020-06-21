
import 'package:flutter/foundation.dart';
import 'package:shop/models/cart_item.dart';
class CartProvider extends ChangeNotifier{
Map<String,CartItem>_items={};
Map<String,CartItem>get items{
  return _items;
}
int get itemCount{
  return _items==null?0:items.length;
}
double get total{
  var totalAmount=0.0;
  _items.forEach((key,item)=>totalAmount+=item.price*item.quantity);
  return totalAmount;

}
addToCart(String id,String title,double price){
  if(_items.containsKey(id)){
    _items.update(id, (item)=>CartItem(id: item.id,title: item.title,quantity: item.quantity+1,price: item.price));
    
  }
  else{
    _items.putIfAbsent(id,()=> CartItem(id: DateTime.now().toString(),title: title,quantity:1 ,price: price));
  }
  notifyListeners();

}
void removeItem(id){
  _items.remove(id);
  notifyListeners();
}
void clear() {
  _items = {};
  notifyListeners();
}
void removeSingleItem(String id){
  if(!_items.containsKey(id)){
    return;
  }
  if(_items[id].quantity>1){
    _items.update(id, (product)=>CartItem(id: product.id,price: product.price,quantity: product.quantity-1,title: product.title));
  }
  else{
    _items.remove(id);
  }
  notifyListeners();
}


}