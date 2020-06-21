import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductResponse extends ChangeNotifier{

  final String id;//ay 7aga final lazm intialize ya2ma hena ya2ma 3n taree2 l-constructor 8er kda haydik error
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  //madam 3mlt dol final yb2a dol blnsbaly required lam yd5lo
  ProductResponse({@required this.id,@required this.title,@required this.description,@required this.price,@required this.imageUrl,this.isFavorite=false});
  Future<void> toggleButton(String authToken,String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = 'https://fir-1-85c31.firebaseio.com/userFavorite/$userId/$id.json?auth=$authToken';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }
}

//isfavorite kda 'Na 3mlha 'N 2ymtha b false lw mtb3tt4 f l-constructor l-intialize bta3ha y3nii
