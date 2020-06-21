import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/Categories_Response.dart';
import 'package:foodapp/model/meals_response.dart';
import 'package:foodapp/screens/categories_screen.dart';
import 'package:foodapp/utilits/space.dart';
class CategoryItem extends StatelessWidget {
  var item,type,index;
  CategoryItem({this.index,this.item,this.type});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        if(type=="category"){
          print(index.toString());
        Navigator.pushNamed(context, "/categories",arguments: index);}
        else{
          Navigator.pushNamed(context, "/details",arguments: Meal(strMeal: item.strMeal,strMealThumb: item.strMealThumb));


    }
      },
      child: Container(




        decoration: BoxDecoration(
          color: Colors.white,


          border: Border.all(



          ),

          borderRadius: BorderRadius.circular(10),


        ),



        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: Space(context).height/60,),



          FadeInImage.assetNetwork(
            height: type=="category"?Space(context).height/10:Space(context).height/7,
            width: type=="category"?Space(context).width/4:Space(context).width/3,
            placeholder: 'assets/images/loading1.gif',
            image: type=="category"?item.strCategoryThumb:item.strMealThumb,
          ),

          Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),

                      child: Text(type=="category"?item.strCategory:item.strMeal,style: TextStyle(
                          fontSize: Space(context).width/25,

                      ),textAlign: TextAlign.center,),

                  ),
                )


              ]
          ),
        ),


      ),
    );
  }
}
