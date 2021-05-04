class UserAuditLogs {
  List<Logs> logs;
  String message;

  UserAuditLogs({this.logs, this.message});

  UserAuditLogs.fromJson(Map<String, dynamic> json) {
    if (json['logs'] != null) {
      logs = new List<Logs>();
      json['logs'].forEach((v) {
        logs.add(new Logs.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logs != null) {
      data['logs'] = this.logs.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Logs {
  String sId;
  String type;
  String createdAt;
  String category;
  String name;
  String documentId;
  String content;

  Logs({this.sId, this.type, this.createdAt, this.category, this.name,this.documentId, this.content});

  Logs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    createdAt = json['createdAt'];
    category = json['category'];
    name = json['name'];
    documentId = json['documentId'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['category'] = this.category;
    data['name'] = this.name;
    data['documentId'] = this.documentId;
    data['content'] = this.content;
    return data;
  }
}
