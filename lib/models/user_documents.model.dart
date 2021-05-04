// To parse this JSON data, do
//
//     final userDocuments = userDocumentsFromJson(jsonString);

import 'dart:convert';

UserDocuments userDocumentsFromJson(String str) => UserDocuments.fromJson(json.decode(str));

String userDocumentsToJson(UserDocuments data) => json.encode(data.toJson());

class UserDocuments {
  List<Document> documents;
  String message;

  UserDocuments({
    this.documents,
    this.message,
  });

  factory UserDocuments.fromJson(Map<String, dynamic> json) => UserDocuments(
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
  List<FileInfoElement> fileInfo;
  String id;
  String documentId;
  String status;
  String to;
  String category;
  String name;
  String from;
  String userId;
  DateTime createdAt;
  DateTime modifiedAt;
  int v;

  Document({
    this.deleted,
    this.fileInfo,
    this.id,
    this.documentId,
    this.status,
    this.to,
    this.category,
    this.name,
    this.from,
    this.userId,
    this.createdAt,
    this.modifiedAt,
    this.v,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    deleted: json["deleted"],
    fileInfo: List<FileInfoElement>.from(json["fileInfo"].map((x) => FileInfoElement.fromJson(x))),
    id: json["_id"],
    documentId: json["documentId"],
    status: json["status"],
    to: json["to"],
    category: json["category"],
    name: json["name"],
    from: json["from"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "deleted": deleted,
    "fileInfo": List<dynamic>.from(fileInfo.map((x) => x.toJson())),
    "_id": id,
    "documentId": documentId,
    "status": status,
    "to": to,
    "category": category,
    "name": name,
    "from": from,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "__v": v,
  };
}

class FileInfoElement {
  String id;
  String fileUrl;
  FileInfoFileInfo fileInfo;
  DateTime createdAt;
  int v;

  FileInfoElement({
    this.id,
    this.fileUrl,
    this.fileInfo,
    this.createdAt,
    this.v,
  });

  factory FileInfoElement.fromJson(Map<String, dynamic> json) => FileInfoElement(
    id: json["_id"],
    fileUrl: json["fileUrl"],
    fileInfo: FileInfoFileInfo.fromJson(json["fileInfo"]),
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fileUrl": fileUrl,
    "fileInfo": fileInfo.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}

class FileInfoFileInfo {
  String fieldname;
  String originalname;
  String encoding;
  String mimetype;
  String destination;
  String filename;
  String path;
  int size;
  List<String> pdfImageUrls;

  FileInfoFileInfo({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
    this.pdfImageUrls,
  });

  factory FileInfoFileInfo.fromJson(Map<String, dynamic> json) => FileInfoFileInfo(
    fieldname: json["fieldname"],
    originalname: json["originalname"],
    encoding: json["encoding"],
    mimetype: json["mimetype"],
    destination: json["destination"],
    filename: json["filename"],
    path: json["path"],
    size: json["size"],
    pdfImageUrls: List<String>.from(json["pdfImageUrls"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fieldname": fieldname,
    "originalname": originalname,
    "encoding": encoding,
    "mimetype": mimetype,
    "destination": destination,
    "filename": filename,
    "path": path,
    "size": size,
    "pdfImageUrls": List<dynamic>.from(pdfImageUrls.map((x) => x)),
  };
}
