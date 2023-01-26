// To parse this JSON data, do
//
//     final dishTo = dishToFromJson(jsonString);

import 'dart:convert';

List<DishTo> listFromJson(String str) =>
    List<DishTo>.from(json.decode(str).map((x) => DishTo.fromJson(x)));

String mapToJson(List<DishTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DishTo {
  DishTo(
      {required this.id,
      //required this.title,
      required this.name,
      required this.price});

  //int id;
  //String title;

  int id;

  String name;

  double price;

  factory DishTo.fromJson(Map<String, dynamic> json) => DishTo(
      // id: json["id"],
      // title: json["title"],
      id: json["id"],
      name: json["name"],
      price: json["price"]);

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "title": title,
        'id': id,
        'name': name,
        'price': price
      };
}
