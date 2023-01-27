import 'dart:convert';

import 'package:api_demo/models/group_order_to.dart';
import 'package:api_demo/models/item_to.dart';
import 'package:http/http.dart' as http;
import "api_constants.dart";

class ItemServiceAPI {
  String url_endpoint = ApiConstants.baseUrl + ApiConstants.itemEndpoint;
  Future<ItemTo?> createItem(ItemTo item) async {
    try {
      var url = Uri.parse(url_endpoint);
      var b = jsonEncode(item.toJson());
      var response = await http.post(url, body: b);
      if (response.statusCode == 201) {
        ItemTo _model = ItemTo.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ItemTo?> updateItem(int id) async {
    try {
      url_endpoint += "/$id";
      var url = Uri.parse(url_endpoint);
      var response = await http.patch(url);
      if (response.statusCode == 200) {
        ItemTo _model = ItemTo.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteItem(int id) async {
    try {
      url_endpoint += "/$id";
      var url = Uri.parse(url_endpoint);
      var response = await http.delete(url);
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e.toString());
    }
  }
}
