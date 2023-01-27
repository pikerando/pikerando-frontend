import 'dart:convert';

import 'package:api_demo/models/group_order_to.dart';
import 'package:api_demo/models/restaurant_to.dart';
import 'package:http/http.dart' as http;
import "api_constants.dart";

class RestaurantServiceAPI {
  String url_endpoint = ApiConstants.baseUrl + ApiConstants.RestaurantEndpoint;
  Future<List<RestaurantTo>?> listRestaurants() async {
    var url = Uri.parse(url_endpoint);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<RestaurantTo> _model = RestuarnatListFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<RestaurantTo?> showRestaurantById(int id) async {
    url_endpoint += "/$id";
    var url = Uri.parse(url_endpoint);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        RestaurantTo _model = RestaurantTo.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
