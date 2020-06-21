import 'package:flutter/material.dart';
import 'package:foodapp/model/Categories_Response.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/providers/meals_provider.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/tab_item.dart';
import 'package:provider/provider.dart';
class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  index = ModalRoute.of(context).settings.arguments;
    final provider=Provider.of<CategoryProvider>(context,listen: false);
    final meals=Provider.of<MealsProvider>(context,listen: false);
    final List<Category>items=provider.items.categories;
    return DefaultTabController(
      initialIndex: index,

      length: items.length,
      child: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(Space(context).height/6), // here the desired height
    child: AppBar(
          backgroundColor: PrimaryDarkColor,

          bottom: TabBar(

            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,


            tabs: items.map((item) => Text(item.strCategory)).toList()
          ),
          title: Text('Meals',style: TextStyle(color: Colors.black),),
        )
        ),
        body: TabBarView(


          children:items.map((item) => TabItem(item.strCategory,item.strCategoryDescription,item.strCategoryThumb)).toList() ,
        ),
      ),

    );
  }

}


