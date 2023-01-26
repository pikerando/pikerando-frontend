import 'dart:convert';

import 'package:api_demo/models/group_order_to.dart';
import 'package:http/http.dart' as http;
import "api_constants.dart";

class GroupOrderServiceAPI {
  var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.groupOrderEndpoint);
  var header = {
    "content-type": "application/json",
    "accept": "application/json",
  };
  // call GroupOrderServiceAPI().listGroupOrders() to get the data
  Future<List<GroupOrderTO>?> listGroupOrders() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<GroupOrderTO> _model = listFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // how to use
  //   GroupOrderTO order = GroupOrderTO(
  //     id: 1,
  //     name: "testorder",
  //     creator: "test",
  //     restaurantId: 3,
  //     status: "OPEN",
  //     totalPrice: 0.0);
  // GroupOrderTO? o;
  // await GroupOrderServiceAPI()
  //     .createGroupOrder(order)
  Future<GroupOrderTO?> createGroupOrder(GroupOrderTO order) async {
    try {
      var b = jsonEncode(order.toJson());
      var response = await http.post(url, body: b);
      if (response.statusCode == 201) {
        GroupOrderTO _model = GroupOrderTO.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
