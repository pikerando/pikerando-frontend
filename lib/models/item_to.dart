// To parse this JSON data, do
//
//     final itemTo = itemToFromJson(jsonString);

import 'dart:convert';

List<ItemTo> listFromJson(String str) =>
    List<ItemTo>.from(json.decode(str).map((x) => ItemTo.fromJson(x)));

String mapToJson(List<ItemTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemTo {
  ItemTo({
    required this.id,
    //required this.title,
    required this.dishName,
    required this.groupOrderId,
    required this.creator,
    required this.price,
    required this.extras,
  });

  //int id;
  //String title;

  int id;

  String dishName;

  String creator;

  int groupOrderId;

  double price = 0;

  String extras;

  factory ItemTo.fromJson(Map<String, dynamic> json) => ItemTo(
        // id: json["id"],
        // title: json["title"],
        id: json['id'],
        dishName: json['dishName'],
        creator: json['creator'],
        groupOrderId: json['groupOrderId'],
        price: json['price'],
        extras: json['extras'],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "title": title,
        'id': id,
        'dishName': dishName,
        'creator': creator,
        'groupOrderId': groupOrderId,
        'price': price,
        'extras': extras
      };
}
