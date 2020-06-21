
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:foodapp/model/meals_response.dart';
import 'package:foodapp/network/api.dart';
import 'package:foodapp/network/url.dart';

class MealsProvider extends ChangeNotifier{
  MealsResponse _item;
  List<Meal> get items=>_item.meals;
  Future<void> getMeals(name)async{
   var response= await api.getWithoutHeader(BASE_URL+FILTER+"?c=$name");

   _item = MealsResponse.fromJson(json.decode(response.body));
   notifyListeners();

  }


}