import 'package:flutter/material.dart';
import 'package:foodapp/providers/category_provider.dart';
import 'package:foodapp/providers/connectivity_provider.dart';
import 'package:foodapp/providers/details_provider.dart';
import 'package:foodapp/providers/meals_provider.dart';
import 'package:foodapp/screens/categories_screen.dart';
import 'package:foodapp/screens/home.dart';
import 'package:foodapp/screens/meal_details.dart';
import 'package:foodapp/trainer.dart';
import 'package:foodapp/utilits/connect_status.dart';
import 'package:foodapp/widget/categories_item.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (_) => ConnectivityService().connectionStatusController.stream,

      child: MultiProvider(
          providers: [


          ChangeNotifierProvider.value(
          value: CategoryProvider(),
      ),
            ChangeNotifierProvider.value(
              value: MealsProvider(),
            ),
            ChangeNotifierProvider.value(
              value: DetailsProvider(),
            ),
        ],
          child:MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue
              ),
              initialRoute: "/home",
              routes: <String, WidgetBuilder>{
                '/categories': (BuildContext context) => Categories(),
                '/home': (BuildContext context) => Home(),
                '/details': (BuildContext context) => MealDetails(),
                '/trainer': (BuildContext context) => Training(),


              })
      ),
    );
  }
}



