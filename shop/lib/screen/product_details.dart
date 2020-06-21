import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/productResponse.dart';
import 'package:shop/providers/product_provider.dart';
class ProductDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ProductResponse productResponse=ModalRoute.of(context).settings.arguments;
   final  product=Provider.of<ProductProvider>(context,listen: false).findById(productResponse.id);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(productResponse.title),
              background: Hero(
                tag: productResponse.id,
                child: Image.network(
                  productResponse.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Text(
                  '\$${productResponse.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    productResponse.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 800,),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
