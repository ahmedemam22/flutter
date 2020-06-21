import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product_provider.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/user_productitem.dart';
class UserProductScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductProvider>(context,listen: false).fetchAndSetProducts(true);
  }
  @override
  Widget build(BuildContext context) {
   // final product=Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/edit');
            },
          ),
        ],
      ),
      drawer: Menu(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
        snapshot.connectionState == ConnectionState.waiting
            ? Center(
          child: CircularProgressIndicator(),
        )
            : RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: Consumer<ProductProvider>(
            builder: (ctx, productsData, _) => Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: productsData.items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      productsData.items[i].id,
                      productsData.items[i].title,
                      productsData.items[i].imageUrl,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
