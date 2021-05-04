class GetDocuSignModel {
  List<Documents> documents;
  String message;

  GetDocuSignModel({this.documents, this.message});

  GetDocuSignModel.fromJson(Map<String, dynamic> json) {
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
  String status;
  String sId;
  String from;
  String to;
  String webhookurl;
  String returntoken;
  List<FileInfo> fileInfo;
  String appId;
  String createdAt;
  int iV;

  Documents(
      {this.status,
        this.sId,
        this.from,
        this.to,
        this.webhookurl,
        this.returntoken,
        this.fileInfo,
        this.appId,
        this.createdAt,
        this.iV});

  Documents.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    from = json['from'];
    to = json['to'];
    webhookurl = json['webhookurl'];
    returntoken = json['returntoken'];
    if (json['fileInfo'] != null) {
      fileInfo = new List<FileInfo>();
      json['fileInfo'].forEach((v) {
        fileInfo.add(new FileInfo.fromJson(v));
      });
    }
    appId = json['appId'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['webhookurl'] = this.webhookurl;
    data['returntoken'] = this.returntoken;
    if (this.fileInfo != null) {
      data['fileInfo'] = this.fileInfo.map((v) => v.toJson()).toList();
    }
    data['appId'] = this.appId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FileInfo {
  String sId;
  String fileUrl;
  FileInformation fileInfo;
  String createdAt;
  int iV;

  FileInfo({this.sId, this.fileUrl, this.fileInfo, this.createdAt, this.iV});

  FileInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fileUrl = json['fileUrl'];
    fileInfo = json['fileInfo'] != null
        ? new FileInformation.fromJson(json['fileInfo'])
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

class FileInformation {
  String fieldname;
  String originalname;
  String encoding;
  String mimetype;
  String destination;
  String filename;
  String path;
  int size;
  List<String> pdfImageUrls;

  FileInformation(
      {this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.destination,
        this.filename,
        this.path,
        this.size,
        this.pdfImageUrls});

  FileInformation.fromJson(Map<String, dynamic> json) {
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