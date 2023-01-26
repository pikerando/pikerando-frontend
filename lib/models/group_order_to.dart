// To parse this JSON data, do
//
//     final groupOrderTo = groupOrderToFromJson(jsonString);

import 'dart:convert';

List<GroupOrderTO> listFromJson(String str) => List<GroupOrderTO>.from(
    json.decode(str).map((x) => GroupOrderTO.fromJson(x)));

String mapToJson(List<GroupOrderTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroupOrderTO {
  GroupOrderTO({
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

  factory GroupOrderTO.fromJson(Map<String, dynamic> json) => GroupOrderTO(
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
