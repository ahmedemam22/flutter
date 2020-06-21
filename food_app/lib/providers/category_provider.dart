import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapp/model/Categories_Response.dart';
import 'package:foodapp/network/api.dart';
import 'package:foodapp/network/url.dart';

import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;
CategoriesResponse _list;
List<Category>_search=[];

  get items => _list;
  get searchItems => _search;
  Future<void> getCategoris() async {
    http.Response response =
    await api.getWithoutHeader(BASE_URL + CATEGORIES);
      _list = CategoriesResponse.fromJson(json.decode(response.body));
      notifyListeners();
    }
    void search(value){
    _search.clear();
    notifyListeners();
     _search= _list.categories.where((item) => item.strCategory==value).toList();
     print(_search);
     notifyListeners();

    

    }
  }





