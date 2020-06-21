
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/meals_response.dart';
import 'package:foodapp/providers/details_provider.dart';
import 'package:foodapp/utilits/color.dart';
import 'package:foodapp/utilits/space.dart';
import 'package:foodapp/widget/dtails_items.dart';
import 'package:foodapp/widget/net_connect.dart';
import 'package:provider/provider.dart';
class MealDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Meal  meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[

            SliverAppBar(
              expandedHeight: Space(context).height / 3,
              backgroundColor: PrimaryDarkColor,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: (

                  FittedBox(
                    fit: BoxFit.fitWidth,
                      child: Text(meal.strMeal, style: TextStyle(
                        fontSize: Space(context).width/25
                      ),))
                ),

                background: Hero(
                  tag: 1,
                  child: Image.network(
                    meal.strMealThumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
              body:FutureBuilder(
                      future: Provider.of<DetailsProvider>(
                          context, listen: false).getDetails(meal.strMeal),
                      builder: (ctx, dataSnapshot) {
                        if (dataSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: LinearProgressIndicator(backgroundColor: PrimaryDarkColor));
                        } else {
                          if (dataSnapshot.error != null) {
                            // ...
                            // Do error handling stuff
                            return Center(
                              child: Text('An error occurred!'),
                            );
                          } else {
    return Consumer<DetailsProvider>(
    builder: (ctx, detailsData, child) =>
    ListView(children: <Widget>[NetworkSensitive(child:ItemDetails(detailsData.items))]));
                          }
                        }
                      },
                    )



                ),




    );
  }
 }

