import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product_provider.dart';
class UserProductItem extends StatelessWidget {
  String id;
  String title;
  String url;
  UserProductItem(this.id,this.title,this.url);
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('/edit', arguments: id);




              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
    onPressed: () async {
      try {
        await Provider.of<ProductProvider>(context, listen: false)
            .deleteProduct(id);
      } catch (error) {
        scaffold.showSnackBar(
          SnackBar(
            content: Text('Deleting failed!', textAlign: TextAlign.center,),
          ),
        );
      }
    },
    color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
