import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth_provider.dart';
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(title: Text("Hello Friend"),
        automaticallyImplyLeading: false,),
        Divider(),
        ListTile(
          title: Text("Shop"),
          leading: Icon(Icons.shop),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/product');

          },

        ),
        ListTile(
          title: Text("orders"),
          leading: Icon(Icons.payment),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/order');


          },


        ),
        ListTile(
          title: Text("Manage Product"),
          leading: Icon(Icons.edit),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/yourproduct');

          },

        ),
        ListTile(
          title: Text("Log Out"),
          leading: Icon(Icons.exit_to_app),
          onTap: (){
       //     Navigator.of(context).pushReplacementNamed('/yourproduct');
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');//y3nii arg3 tanii llmain
            Provider.of<AuthProvider>(context,listen: false).logout();

          },

        ),
      ],),

    );
  }
}
