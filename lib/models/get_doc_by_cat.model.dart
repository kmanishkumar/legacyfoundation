// To parse this JSON data, do
//
//     final getDocsByCat = getDocsByCatFromJson(jsonString);

import 'dart:convert';

GetDocsByCat getDocsByCatFromJson(String str) => GetDocsByCat.fromJson(json.decode(str));

String getDocsByCatToJson(GetDocsByCat data) => json.encode(data.toJson());

class GetDocsByCat {
  List<Document> documents;
  String message;

  GetDocsByCat({
    this.documents,
    this.message,
  });

  factory GetDocsByCat.fromJson(Map<String, dynamic> json) => GetDocsByCat(
    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    "message": message,
  };
}

class Document {
  bool deleted;
  List<dynamic> fileInfo;
  String id;
  String name;
  String desc;
  String category;
  String to;
  String userId;
  String documentId;
  DateTime createdAt;
  DateTime modifiedAt;
  int v;

  Document({
    this.deleted,
    this.fileInfo,
    this.documentId,
    this.id,
    this.name,
    this.desc,
    this.category,
    this.to,
    this.userId,
    this.createdAt,
    this.modifiedAt,
    this.v,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    deleted: json["deleted"],
    fileInfo: List<dynamic>.from(json["fileInfo"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    desc: json["desc"],
    category: json["category"],
    to: json["to"],
    userId: json["userId"],
    documentId: json["documentId"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "deleted": deleted,
    "fileInfo": List<dynamic>.from(fileInfo.map((x) => x)),
    "_id": id,
    "name": name,
    "desc": desc,
    "category": category,
    "to": to,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "__v": v,
  };
}
