// To parse this JSON data, do
//
//     final GroupOrderTo = GroupOrderToFromJson(jsonString);

import 'dart:convert';

List<GroupOrderTo> groupOrderListFromJson(String str) =>
    List<GroupOrderTo>.from(
        json.decode(str).map((x) => GroupOrderTo.fromJson(x)));

String mapGroupOrderToJson(List<GroupOrderTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroupOrderTo {
  GroupOrderTo({
    required this.id,
    //required this.title,
    required this.name,
    required this.restaurantId,
    required this.creator,
    required this.status,
    required this.totalPrice,
  });

  //int id;
  //String title;

  int id;

  String name;

  int restaurantId;

  String creator;

  String status;
  //enum statusEnum {  open,  closed,  };

  double totalPrice = 0;

  factory GroupOrderTo.fromJson(Map<String, dynamic> json) => GroupOrderTo(
        // id: json["id"],
        // title: json["title"],
        id: json["id"],
        name: json["name"],
        restaurantId: json["restaurantId"],
        creator: json["creator"],
        status: json["status"],
        totalPrice: json["totalPrice"],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'restaurantId': restaurantId,
      'creator': creator,
      'status': status,
      'totalPrice': totalPrice
    };
  }
}
