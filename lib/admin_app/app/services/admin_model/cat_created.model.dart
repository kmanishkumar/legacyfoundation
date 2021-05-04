// To parse this JSON data, do
//
//     final catCreatedModel = catCreatedModelFromJson(jsonString);

import 'dart:convert';

CatCreatedModel catCreatedModelFromJson(String str) => CatCreatedModel.fromJson(json.decode(str));

String catCreatedModelToJson(CatCreatedModel data) => json.encode(data.toJson());

class CatCreatedModel {
  Category category;
  String message;

  CatCreatedModel({
    this.category,
    this.message,
  });

  factory CatCreatedModel.fromJson(Map<String, dynamic> json) => CatCreatedModel(
    category: Category.fromJson(json["category"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "category": category.toJson(),
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
