class GetDocumentsLog {
  List<Logs> logs;
  int count;
  String message;

  GetDocumentsLog({this.logs, this.count, this.message});

  GetDocumentsLog.fromJson(Map<String, dynamic> json) {
    if (json['logs'] != null) {
      logs = new List<Logs>();
      json['logs'].forEach((v) {
        logs.add(new Logs.fromJson(v));
      });
    }
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logs != null) {
      data['logs'] = this.logs.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['message'] = this.message;
    return data;
  }
}

class Logs {
  String sId;
  String userId;
  String description;
  String type;
  String createdAt;
  int iV;

  Logs(
      {this.sId,
      this.userId,
      this.description,
      this.type,
      this.createdAt,
      this.iV});

  Logs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    description = json['description'];
    type = json['type'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['description'] = this.description;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
