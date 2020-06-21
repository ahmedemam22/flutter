import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/fade_image.dart';
import 'package:foodapp/widget/grid_meal.dart';
import 'package:foodapp/widget/net_connect.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'categories_item.dart';
import 'dialog.dart';
class TabItem extends StatelessWidget {
  final strDescription;
  final strname;
  final strImage;
  TabItem(this.strname,this.strDescription,this.strImage);
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: <Widget>[
           
             Container(
                height: Space(context).height/5,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: PrimaryDarkColor,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: rowContent(context)
                ),
           
           
            SizedBox(height: 10,),
            Expanded(child: NetworkSensitive(child: GridMeal(strname)))


          ],
        ),

    );
  }

  Widget rowContent(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
    ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    
    child: Image.network(
      
    strImage,
    height:Space(context).height/5,
    width: Space(context).width/3,
    ),
    ),
    Expanded(

        child: InkWell(
            onTap: (){
              Dialoge().buildDialog(context, strname, strDescription);

            },
            child: SingleChildScrollView(child: Text(strDescription))))

      ],
    );
  }


}
