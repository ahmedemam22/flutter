
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:foodapp/model/details_response.dart';
import 'package:foodapp/network/api.dart';
import 'package:foodapp/network/url.dart';

class DetailsProvider extends ChangeNotifier{


DetailsResponse _item;
List<Map<String, String>> get items=>_item.meals;
Future<void> getDetails(name)async{
  var response= await api.getWithoutHeader(BASE_URL+SEARCH+"?s=$name");

  _item = DetailsResponse.fromJson(json.decode(response.body));
  notifyListeners();

}
}