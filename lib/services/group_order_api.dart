import 'dart:convert';

import 'package:api_demo/models/group_order_to.dart';
import 'package:api_demo/models/item_to.dart';
import 'package:http/http.dart' as http;
import "api_constants.dart";

class GroupOrderServiceAPI {
  // call GroupOrderServiceAPI().listGroupOrders() to get the data
  String url_endpoint = ApiConstants.baseUrl + ApiConstants.groupOrderEndpoint;
  Future<List<GroupOrderTo>?> listGroupOrders() async {
    var url = Uri.parse(url_endpoint);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<GroupOrderTo> _model = groupOrderListFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GroupOrderTo?> createGroupOrder(GroupOrderTo order) async {
    try {
      var url = Uri.parse(url_endpoint);
      var b = jsonEncode(order.toJson());
      var response = await http.post(url, body: b);
      if (response.statusCode == 201) {
        GroupOrderTo _model = GroupOrderTo.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<ItemTo>?> showGroupOrderById(int id) async {
    url_endpoint += "/$id";
    var url = Uri.parse(url_endpoint);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ItemTo> _model = itemListFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GroupOrderTo?> updateStatusOfGroupOrder(int id) async {
    try {
      url_endpoint += "/$id";
      var url = Uri.parse(url_endpoint);
      var response = await http.patch(url);
      if (response.statusCode == 201) {
        GroupOrderTo _model = GroupOrderTo.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteGroupOrder(int id) async {
    try {
      url_endpoint += "/$id";
      var url = Uri.parse(url_endpoint);
      var response = await http.delete(url);
      if (response.statusCode == 201) {}
    } catch (e) {
      print(e.toString());
    }
  }
}
