import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:provider/provider.dart';

import 'categories_item.dart';
class GridCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category=Provider.of<CategoryProvider>(context,listen: false);
    return FutureBuilder(
      future: category.getCategoris(),
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
            return Consumer<CategoryProvider>(
              builder: (ctx, categoryData, child) =>
                  GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: category.searchItems.length==0?category.items.categories.length:category.searchItems.length,
                  itemBuilder: (ctx, i) => CategoryItem(index:i,item:category.searchItems.length==0?category.items.categories[i]:category.searchItems[i],type:"category"),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
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
