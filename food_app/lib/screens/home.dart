import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/grid_category.dart';
import 'package:foodapp/widget/net_connect.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {
  TextEditingController _search=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Space(context).height*0.3,
            width: Space(context).width,
            color: PrimaryDarkColor,
            child: Padding(
              padding: EdgeInsets.all( Space(context).height/25,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,


                children: <Widget>[
                  Text("Food",
                  style: TextStyle(
                    fontSize: Space(context).width/15,
                    color: Colors.white,


                  ),),
                  Padding(
                    padding: EdgeInsets.only(top: Space(context).height/30),
                      child: Container(
                        height: Space(context).height/15,
                          child: textField(context)))

                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all( Space(context).height/25),
            child: Text("Meal Categories",
            style: TextStyle(
              fontSize:Space(context).width/18,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),


          ),
          Expanded(child: NetworkSensitive(child: GridCategory()))


        ],
      ),
    );
  }
  Widget textField(context){
    return  new TextField(
      controller: _search,
      onChanged: (v){
        Provider.of<CategoryProvider>(context,listen: false).search(_search.text);


      },


      decoration: new InputDecoration(
          prefixIcon:  Icon(Icons.search),


          border: new OutlineInputBorder(

            borderRadius: const BorderRadius.all(
              const Radius.circular(15.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: "Search",


          fillColor: Colors.white),
    );

  }
}
