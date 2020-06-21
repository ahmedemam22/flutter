// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
 List<Category> categories;

 CategoriesResponse({
  this.categories,
 });

 factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
  categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
 );

 Map<String, dynamic> toJson() => {
  "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
 };
}

class Category {
 String idCategory;
 String strCategory;
 String strCategoryThumb;
 String strCategoryDescription;

 Category({
  this.idCategory,
  this.strCategory,
  this.strCategoryThumb,
  this.strCategoryDescription,
 });

 factory Category.fromJson(Map<String, dynamic> json) => Category(
  idCategory: json["idCategory"],
  strCategory: json["strCategory"],
  strCategoryThumb: json["strCategoryThumb"],
  strCategoryDescription: json["strCategoryDescription"],
 );

 Map<String, dynamic> toJson() => {
  "idCategory": idCategory,
  "strCategory": strCategory,
  "strCategoryThumb": strCategoryThumb,
  "strCategoryDescription": strCategoryDescription,
 };
}
