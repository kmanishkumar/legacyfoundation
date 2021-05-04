// To parse this JSON data, do
//
//     final getAllCat = getAllCatFromJson(jsonString);

import 'dart:convert';

GetAllCat getAllCatFromJson(String str) => GetAllCat.fromJson(json.decode(str));

String getAllCatToJson(GetAllCat data) => json.encode(data.toJson());

class GetAllCat {
  List<Category> categories;
  String message;

  GetAllCat({
    this.categories,
    this.message,
  });

  factory GetAllCat.fromJson(Map<String, dynamic> json) => GetAllCat(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "message": message,
  };
}

class Category {
  String id;
  String name;
  String description;
  String userId;
  DateTime createdAt;
  int v;

  Category({
    this.id,
    this.name,
    this.description,
    this.userId,
    this.createdAt,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}
