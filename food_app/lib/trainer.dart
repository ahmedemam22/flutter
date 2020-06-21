import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/Categories_Response.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/categories_item.dart';
import 'package:provider/provider.dart';

import 'network/api.dart';
class Training extends StatelessWidget {
  Map<String,CategoriesResponse>items={};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryProvider>(context, listen: false)
          .getCategoris(),
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LinearProgressIndicator(backgroundColor: PrimaryDarkColor));
        } else {
          if (dataSnapshot.error != null) {
            // ...
            // Do error handling stuff
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return Consumer<CategoryProvider>(
              builder: (ctx, orderData, child) =>
                  Text("${orderData.items.categories[0].idCategory}")

            );
          }
        }
      },
    );

  }
}
