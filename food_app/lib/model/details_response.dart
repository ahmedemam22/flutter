// To parse this JSON data, do
//
//     final detailsResponse = detailsResponseFromJson(jsonString);

import 'dart:convert';

DetailsResponse detailsResponseFromJson(String str) => DetailsResponse.fromJson(json.decode(str));

String detailsResponseToJson(DetailsResponse data) => json.encode(data.toJson());

class DetailsResponse {
  List<Map<String, String>> meals;

  DetailsResponse({
    this.meals,
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) => DetailsResponse(
    meals: List<Map<String, String>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
  };
}
