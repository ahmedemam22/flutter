import 'dart:convert';

import 'package:foodapp/model/Categories_Response.dart';
import 'package:foodapp/network/url.dart';
import 'package:http/http.dart' as http;

class Api{

  Future<Map>getDataWithHeader(url,header)async {
    http.Response response = await http.get(url,headers: header);

    return json.decode(response.body);

  }
   dynamic getWithoutHeader(String url) async {
     http.Response response = await http.get(url);
     return response;
   }
  dynamic post(String url, dynamic data, {dynamic headers}) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    return response;
  }

}
Api api=Api();