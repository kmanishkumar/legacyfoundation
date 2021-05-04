class DeleteUserModel {
  String message;
  String resMsg;

  DeleteUserModel({this.message, this.resMsg});

  DeleteUserModel.fromJson(Map<String, dynamic> json) {
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

class DeleteUserErrorModel {
  String error;
  String desc;
  String resMsg;

  DeleteUserErrorModel({this.error, this.desc, this.resMsg});

  DeleteUserErrorModel.fromJson(Map<String, dynamic> json) {
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
