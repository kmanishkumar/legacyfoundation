///***
// *
// * Get Documents  Model
// *
// * */
//
//class GetDocumentsModel {
//  List<Documents> documents;
//  String message;
//
//  GetDocumentsModel({this.documents, this.message});
//
//  GetDocumentsModel.fromJson(Map<String, dynamic> json) {
//    if (json['documents'] != null) {
//      documents = new List<Documents>();
//      json['documents'].forEach((v) {
//        documents.add(new Documents.fromJson(v));
//      });
//    }
//    message = json['message'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.documents != null) {
//      data['documents'] = this.documents.map((v) => v.toJson()).toList();
//    }
//    data['message'] = this.message;
//    return data;
//  }
//}
//
//class Documents {
//  bool deleted;
//  List<FileInfo> fileInfo;
//  String sId;
//  String name;
//  String documentId;
//  String desc;
//  String status;
//  String to;
//  String from;
//  String userId;
//  String createdAt;
//  String modifiedAt;
//  int iV;
//
//  Documents(
//      {this.deleted,
//        this.fileInfo,
//        this.sId,
//        this.name,
//        this.documentId,
//        this.desc,
//        this.status,
//        this.to,
//        this.from,
//        this.userId,
//        this.createdAt,
//        this.modifiedAt,
//        this.iV});
//
//  Documents.fromJson(Map<String, dynamic> json) {
//    deleted = json['deleted'];
//    if (json['fileInfo'] != null) {
//      fileInfo = new List<FileInfo>();
//      json['fileInfo'].forEach((v) {
//        fileInfo.add(new FileInfo.fromJson(v));
//      });
//    }
//    sId = json['_id'];
//    name = json['name'];
//    documentId = json['documentId'];
//    desc = json['desc'];
//    status = json['status'];
//    to = json['to'];
//    from = json['from'];
//    userId = json['userId'];
//    createdAt = json['createdAt'];
//    modifiedAt = json['modifiedAt'];
//    iV = json['__v'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['deleted'] = this.deleted;
//    if (this.fileInfo != null) {
//      data['fileInfo'] = this.fileInfo.map((v) => v.toJson()).toList();
//    }
//    data['_id'] = this.sId;
//    data['name'] = this.name;
//    data['documentId'] = this.documentId;
//    data['desc'] = this.desc;
//    data['status'] = this.status;
//    data['to'] = this.to;
//    data['from'] = this.from;
//    data['userId'] = this.userId;
//    data['createdAt'] = this.createdAt;
//    data['modifiedAt'] = this.modifiedAt;
//    data['__v'] = this.iV;
//    return data;
//  }
//}
//
//class FileInfo {
//  String sId;
//  String fileUrl;
//  FileInfo fileInfo;
//  String createdAt;
//  int iV;
//
//  FileInfo({this.sId, this.fileUrl, this.fileInfo, this.createdAt, this.iV});
//
//  FileInfo.fromJson(Map<String, dynamic> json) {
//    sId = json['_id'];
//    fileUrl = json['fileUrl'];
//    fileInfo = json['fileInfo'] != null
//        ? new FileInfo.fromJson(json['fileInfo'])
//        : null;
//    createdAt = json['createdAt'];
//    iV = json['__v'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['_id'] = this.sId;
//    data['fileUrl'] = this.fileUrl;
//    if (this.fileInfo != null) {
//      data['fileInfo'] = this.fileInfo.toJson();
//    }
//    data['createdAt'] = this.createdAt;
//    data['__v'] = this.iV;
//    return data;
//  }
//}
//
//class FileInfo {
//  String fieldname;
//  String originalname;
//  String encoding;
//  String mimetype;
//  String destination;
//  String filename;
//  String path;
//  int size;
//  List<String> pdfImageUrls;
//
//  FileInfo(
//      {this.fieldname,
//        this.originalname,
//        this.encoding,;
//        this.mimetype,
//        this.destination,
//        this.filename,
//        this.path,
//        this.size,
//        this.pdfImageUrls});
//
//  FileInfo.fromJson(Map<String, dynamic> json) {
//    fieldname = json['fieldname'];
//    originalname = json['originalname'];
//    encoding = json['encoding'];
//    mimetype = json['mimetype'];
//    destination = json['destination'];
//    filename = json['filename'];
//    path = json['path'];
//    size = json['size'];
//    pdfImageUrls = json['pdfImageUrls'].cast<String>();
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['fieldname'] = this.fieldname;
//    data['originalname'] = this.originalname;
//    data['encoding'] = this.encoding;
//    data['mimetype'] = this.mimetype;
//    data['destination'] = this.destination;
//    data['filename'] = this.filename;
//    data['path'] = this.path;
//    data['size'] = this.size;
//    data['pdfImageUrls'] = this.pdfImageUrls;
//    return data;
//  }
//}
///***
// *
// * Get Documents Error Model
// *
// * */
//
////class GetDocumentsError {
////  String error;
////  String desc;
////
////  GetDocumentsError({this.error, this.desc});
////
////  GetDocumentsError.fromJson(Map<String, dynamic> json) {
////    error = json['error'];
////    desc = json['desc'];
////  }
////
////  Map<String, dynamic> toJson() {
////    final Map<String, dynamic> data = new Map<String, dynamic>();
////    data['error'] = this.error;
////    data['desc'] = this.desc;
////    return data;
////  }
////}






class GetDocumentsModel {
  List<Documents> documents;
  String message;

  GetDocumentsModel({this.documents, this.message});

  GetDocumentsModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = new List<Documents>();
      json['documents'].forEach((v) {
        documents.add(new Documents.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Documents {
  bool deleted;
  List<FileInfoDetails> fileInfo;
  String sId;
  String name;
  String documentId;
  String desc;
  String status;
  String to;
  String from;
  String userId;
  String createdAt;
  String modifiedAt;
  String category;
  int iV;

  Documents(
      {this.deleted,
        this.fileInfo,
        this.sId,
        this.name,
        this.documentId,
        this.desc,
        this.status,
        this.to,
        this.from,
        this.userId,
        this.createdAt,
        this.modifiedAt,
        this.category,
        this.iV});

  Documents.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'];
    if (json['fileInfo'] != null) {
      fileInfo = new List<FileInfoDetails>();
      json['fileInfo'].forEach((v) {
        fileInfo.add(new FileInfoDetails.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    documentId = json['documentId'];
    desc = json['desc'];
    status = json['status'];
    to = json['to'];
    from = json['from'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deleted'] = this.deleted;
    if (this.fileInfo != null) {
      data['fileInfo'] = this.fileInfo.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['documentId'] = this.documentId;
    data['desc'] = this.desc;
    data['status'] = this.status;
    data['to'] = this.to;
    data['from'] = this.from;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FileInfoDetails {
  String sId;
  String fileUrl;
  FileInfoDetails fileInfo;
  String createdAt;
  int iV;

  FileInfoDetails({this.sId, this.fileUrl, this.fileInfo, this.createdAt, this.iV});

  FileInfoDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fileUrl = json['fileUrl'];
    fileInfo = json['fileInfo'] != null
        ? new FileInfoDetails.fromJson(json['fileInfo'])
        : null;
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fileUrl'] = this.fileUrl;
    if (this.fileInfo != null) {
      data['fileInfo'] = this.fileInfo.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FileInfo {
  String fieldname;
  String originalname;
  String encoding;
  String mimetype;
  String destination;
  String filename;
  String path;
  int size;
  List<String> pdfImageUrls;

  FileInfo(
      {this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.destination,
        this.filename,
        this.path,
        this.size,
        this.pdfImageUrls});

  FileInfo.fromJson(Map<String, dynamic> json) {
    fieldname = json['fieldname'];
    originalname = json['originalname'];
    encoding = json['encoding'];
    mimetype = json['mimetype'];
    destination = json['destination'];
    filename = json['filename'];
    path = json['path'];
    size = json['size'];
    pdfImageUrls = json['pdfImageUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldname'] = this.fieldname;
    data['originalname'] = this.originalname;
    data['encoding'] = this.encoding;
    data['mimetype'] = this.mimetype;
    data['destination'] = this.destination;
    data['filename'] = this.filename;
    data['path'] = this.path;
    data['size'] = this.size;
    data['pdfImageUrls'] = this.pdfImageUrls;
    return data;
  }
}





















//
//import 'dart:convert';
//
//GetDocuments getDocumentsFromJson(String str) => GetDocuments.fromJson(json.decode(str));
//
//String getDocumentsToJson(GetDocuments data) => json.encode(data.toJson());
//
//class GetDocuments {
//  List<Document> documents;
//  String message;
//
//  GetDocuments({
//    this.documents,
//    this.message,
//  });
//
//  factory GetDocuments.fromJson(Map<String, dynamic> json) => GetDocuments(
//    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
//    message: json["message"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
//    "message": message,
//  };
//}
//
//class Document {
//  bool deleted;
//  List<FileInfoElement> fileInfo;
//  String id;
//  String name;
//  String documentId;
//  String desc;
//  String status;
//  String to;
//  String from;
//  String userId;
//  DateTime createdAt;
//  DateTime modifiedAt;
//  int v;
//
//  Document({
//    this.deleted,
//    this.fileInfo,
//    this.id,
//    this.name,
//    this.documentId,
//    this.desc,
//    this.status,
//    this.to,
//    this.from,
//    this.userId,
//    this.createdAt,
//    this.modifiedAt,
//    this.v,
//  });
//
//  factory Document.fromJson(Map<String, dynamic> json) => Document(
//    deleted: json["deleted"],
//    fileInfo: List<FileInfoElement>.from(json["fileInfo"].map((x) => FileInfoElement.fromJson(x))),
//    id: json["_id"],
//    name: json["name"],
//    documentId: json["documentId"],
//    desc: json["desc"],
//    status: json["status"],
//    to: json["to"],
//    from: json["from"],
//    userId: json["userId"],
//    createdAt: DateTime.parse(json["createdAt"]),
//    modifiedAt: DateTime.parse(json["modifiedAt"]),
//    v: json["__v"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "deleted": deleted,
//    "fileInfo": List<dynamic>.from(fileInfo.map((x) => x.toJson())),
//    "_id": id,
//    "name": name,
//    "documentId": documentId,
//    "desc": desc,
//    "status": status,
//    "to": to,
//    "from": from,
//    "userId": userId,
//    "createdAt": createdAt.toIso8601String(),
//    "modifiedAt": modifiedAt.toIso8601String(),
//    "__v": v,
//  };
//}
//
//class FileInfoElement {
//  String id;
//  String fileUrl;
//  FileInfoFileInfo fileInfo;
//  DateTime createdAt;
//  int v;
//
//  FileInfoElement({
//    this.id,
//    this.fileUrl,
//    this.fileInfo,
//    this.createdAt,
//    this.v,
//  });
//
//  factory FileInfoElement.fromJson(Map<String, dynamic> json) => FileInfoElement(
//    id: json["_id"],
//    fileUrl: json["fileUrl"],
//    fileInfo: FileInfoFileInfo.fromJson(json["fileInfo"]),
//    createdAt: DateTime.parse(json["createdAt"]),
//    v: json["__v"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "_id": id,
//    "fileUrl": fileUrl,
//    "fileInfo": fileInfo.toJson(),
//    "createdAt": createdAt.toIso8601String(),
//    "__v": v,
//  };
//}
//
//class FileInfoFileInfo {
//  String fieldname;
//  String originalname;
//  String encoding;
//  String mimetype;
//  String destination;
//  String filename;
//  String path;
//  int size;
//  List<String> pdfImageUrls;
//
//  FileInfoFileInfo({
//    this.fieldname,
//    this.originalname,
//    this.encoding,
//    this.mimetype,
//    this.destination,
//    this.filename,
//    this.path,
//    this.size,
//    this.pdfImageUrls,
//  });
//
//  factory FileInfoFileInfo.fromJson(Map<String, dynamic> json) => FileInfoFileInfo(
//    fieldname: json["fieldname"],
//    originalname: json["originalname"],
//    encoding: json["encoding"],
//    mimetype: json["mimetype"],
//    destination: json["destination"],
//    filename: json["filename"],
//    path: json["path"],
//    size: json["size"],
//    pdfImageUrls: List<String>.from(json["pdfImageUrls"].map((x) => x)),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "fieldname": fieldname,
//    "originalname": originalname,
//    "encoding": encoding,
//    "mimetype": mimetype,
//    "destination": destination,
//    "filename": filename,
//    "path": path,
//    "size": size,
//    "pdfImageUrls": List<dynamic>.from(pdfImageUrls.map((x) => x)),
//  };
//}
