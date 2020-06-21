import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/productResponse.dart';
import 'package:shop/providers/auth_provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/product_provider.dart';
import 'package:shop/screen/product_details.dart';
class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<ProductResponse>(context,listen: false);
    final cart=Provider.of<CartProvider>(context,listen: false);
    final auth=Provider.of<AuthProvider>(context,listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(onTap: (){
          Navigator.of(context).pushNamed('/details',arguments:product );
        },
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        footer: GridTileBar(
          title:  Text(product.title,textAlign: TextAlign.center,),
          backgroundColor: Colors.black87,
          leading: Consumer<ProductResponse>(
            builder: (context,product,_)=>
            IconButton(icon:Icon(product.isFavorite?Icons.favorite:Icons.favorite_border),color: Theme.of(context).accentColor,
            onPressed: (){
              product.toggleButton(auth.token,auth.userId);
            },),
          ),
          trailing: Consumer<CartProvider>(
            builder: (context,cartt,_)=>
             IconButton(icon: Icon(Icons.shopping_cart,color: Theme.of(context).accentColor,),onPressed: (){
              cartt.addToCart(product.id, product.title, product.price);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart!',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );

             },),
          ),
        ),

        
      ),
    );
  }
}
