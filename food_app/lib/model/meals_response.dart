// To parse this JSON data, do
//
//     final mealsResponse = mealsResponseFromJson(jsonString);

import 'dart:convert';

MealsResponse mealsResponseFromJson(String str) => MealsResponse.fromJson(json.decode(str));

String mealsResponseToJson(MealsResponse data) => json.encode(data.toJson());

class MealsResponse {
  List<Meal> meals;

  MealsResponse({
    this.meals,
  });

  factory MealsResponse.fromJson(Map<String, dynamic> json) => MealsResponse(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
