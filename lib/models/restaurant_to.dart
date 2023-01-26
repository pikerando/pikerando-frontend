// To parse this JSON data, do
//
//     final restautantTo = restautantToFromJson(jsonString);

import 'dart:convert';
import 'dish_to.dart';

List<RestaurantTo> listFromJson(String str) => List<RestaurantTo>.from(
    json.decode(str).map((x) => RestaurantTo.fromJson(x)));

String mapToJson(List<RestaurantTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantTo {
  RestaurantTo({
    required this.id,
    //required this.title,
    required this.name,
    required this.menu,
  });

  //int id;
  //String title;

  int id;

  String name;

  List<DishTo> menu;

  factory RestaurantTo.fromJson(Map<String, dynamic> json) => RestaurantTo(
      // id: json["id"],
      // title: json["title"],
      id: json['id'],
      name: json['name'],
      menu: json['menu']);

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "title": title,
        'id': id,
        'name': name,
        'menu': menu
      };
}
