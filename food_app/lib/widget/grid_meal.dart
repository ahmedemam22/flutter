import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/providers/meals_provider.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:provider/provider.dart';

import 'categories_item.dart';
class GridMeal extends StatelessWidget {
  String name;
  GridMeal(this.name);
  @override
  Widget build(BuildContext context) {
    final meal=Provider.of<MealsProvider>(context,listen: false);
    return FutureBuilder(
      future: meal.getMeals(name),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            // ...
            // Do error handling stuff
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<MealsProvider>(
              builder: (ctx, mealData, child) =>
                  GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: mealData.items.length,
                    itemBuilder: (ctx, i) => CategoryItem(item:mealData.items[i],type:"",),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (Space(context).width/4)/(Space(context).height/7),

                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),

            );
          }
        }
      },
    );

  }
}
