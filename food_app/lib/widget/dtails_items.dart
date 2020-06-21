import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/providers/details_provider.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class  ItemDetails extends StatelessWidget {
 final item;
  ItemDetails(this.item);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

        containerShape1("Category ${item[0]["strCategory"]}",context),
        containerShape1("Area ${item[0]["strArea"]}",context),
        ],) ,
        ListTile(
          title: Text("Instructions",style: TextStyle(
            color: Colors.pink,
            fontSize: Space(context).width/15

          ),
          ),
          trailing: Icon(Icons.info,color: Colors.pink,),
        ),
        Padding(
          padding: EdgeInsets.all(20),
            child: containerShape(Text("${item[0]["strInstructions"]}"))),
        Padding(
          padding: EdgeInsets.all(20),
            child: containerShape(ingridents())),
        RoundedButton(item[0]["strYoutube"]),
      ],

    );
  }
 Widget containerShape(text) {
   return Container(



     decoration: BoxDecoration(
       color: Colors.white,


       border: Border.all(
           color: Colors.grey


       ),

       borderRadius: BorderRadius.circular(10),


     ),
     child: Padding
       (padding: EdgeInsets.all(5),
         child: text));
 }
 Widget containerShape1(text,context) {
   return Container(
     height: Space(context).height/9,
     width: Space(context).width/2.5,



     decoration: BoxDecoration(
       color: Colors.white,


       border: Border.all(
           color: Colors.grey


       ),

       borderRadius: BorderRadius.circular(10),


     ),
     child: Padding
       (padding: EdgeInsets.all(5),
         child: Center(
           child: Text(text, textAlign: TextAlign.center,style: TextStyle(
             fontSize: Space(context).width/15,
                 color: Colors.pink
           ),),
         )),);
 }
 Widget ingridents(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
   children: <Widget>[
   Container(
   margin: EdgeInsets.all(10),
   child: Text(
   'Ingredients',
   style: TextStyle(fontSize: 18, color: Colors.pink),
   )),
     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: <Widget>[
     Text(

          "\n \u2022" +
     item[0]['strIngredient1'] +
     "\n \u2022" +
     item[0]['strIngredient2'] +
     "\n \u2022" +
     item[0]['strIngredient3'] +
     "\n \u2022" +
     item[0]['strIngredient4'] +
     "\n \u2022" +
     item[0]['strIngredient5'] +
     "\n \u2022" +
     item[0]['strIngredient6'] +
     "\n \u2022" +
     item[0]['strIngredient7'] ??
     "" +
     "\n \u2022" +
     item[0]['strIngredient8'] ??
     "",
     style: TextStyle(
     fontSize: 16,
     ),
     ),
     Text(

         "\n " +
     item[0]['strMeasure1'] +
     "\n " +
     item[0]['strMeasure2'] +
     "\n " +
     item[0]['strMeasure3'] +
     "\n " +
     item[0]['strMeasure4'] +
     "\n " +
     item[0]['strMeasure5'] +
     "\n " +
     item[0]['strMeasure6'] +
     "\n " +
     item[0]['strMeasure7'] ??
     "" + "\n " + item[0]['strMeasure8'] ??
     "",
     style: TextStyle(
     fontSize: 16,
     ),
     ),
     ],
     ),
   ]
   );
 }

 }

