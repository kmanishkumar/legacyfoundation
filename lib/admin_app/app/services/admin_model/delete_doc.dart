class DeleteDocModel {
  String message;
  String resMsg;

  DeleteDocModel({this.message, this.resMsg});

  DeleteDocModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    resMsg = 'success';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;

    data['resMsg'] = this.resMsg;

    return data;
  }
}

class DeleteDocErrorModel {
  String error;
  String desc;
  String resMsg;

  DeleteDocErrorModel({this.error, this.desc, this.resMsg});

  DeleteDocErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    desc = json['desc'];
    resMsg = 'failure';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['desc'] = this.desc;
    data['resMsg'] = this.resMsg;

    return data;
  }
}
