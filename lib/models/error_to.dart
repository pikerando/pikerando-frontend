// To parse this JSON data, do
//
//     final errorTo = errorToFromJson(jsonString);

import 'dart:convert';

List<ErrorTo> listFromJson(String str) =>
    List<ErrorTo>.from(json.decode(str).map((x) => ErrorTo.fromJson(x)));

String mapToJson(List<ErrorTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ErrorTo {
  ErrorTo({
    required this.code,
    //required this.title,
    required this.message,
  });

  //int id;
  //String title;
  int code;

  String message;

  factory ErrorTo.fromJson(Map<String, dynamic> json) => ErrorTo(
      // id: json["id"],
      // title: json["title"],
      code: json["code"],
      message: json["message"]);

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "title": title,
        'code': code,
        'message': message
      };
}
