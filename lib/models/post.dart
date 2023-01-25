// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
     
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
  
  int id ;

  String name ;

  int restaurantId ;

  String creator ;

  String status ;
  //enum statusEnum {  open,  closed,  };

  double totalPrice = 0;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        
       // id: json["id"],
       // title: json["title"],
       id: json["id"],
       name: json["name"],
       restaurantId: json["restaurantId"],
       creator: json["creator"],
       status: json["status"],
       totalPrice: json["totalPrice"],
        
      );

  Map<String, dynamic> toJson() => {
        
       // "id": id,
       // "title": title,
       "id": id,
       "name": name,
       "restaurantId": restaurantId,
       "creator": creator,
       "status": status,
       "totalPrice": totalPrice, 
      };
}
