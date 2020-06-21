import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/productResponse.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/product_provider.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:shop/widgets/products_grid.dart';
enum FilterOptions {
  Favorites,
  All,
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductProvider>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),


          Consumer<CartProvider>(
    builder: (context,cartData,_)=>

             Padding(
              padding: EdgeInsets.only(right: 12,top: 5),
              child: Badge(
                badgeContent: Text(cartData.itemCount.toString()),
                child: IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){

                  Navigator.of(context).pushNamed('/cart');
                },),
              ),
            ),
          )],
      ),

      drawer: Menu(),
      body:_isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ProductGrid(_showOnlyFavorites),
    );

  }
}
