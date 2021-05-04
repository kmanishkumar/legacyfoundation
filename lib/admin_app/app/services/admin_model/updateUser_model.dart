//{
//"updated": {
//"info": {
//"email": "marvel@zibtek.in",
//"role": "5db7e6e291a182431b5efd98",
//"phone": "9182736453"
//},
//"password": "$2b$08$etUd75cv8aShX0tS8Gbu2eEREqaIQXjMZi.3/fomikpFPT7lwuVIy",
//"isBlocked": false,
//"isLoggedIn": true,
//"_id": "5db9535b6cc0a817206e9dfb",
//"firstName": "singa",
//"lastName": "singhisking",
//"role": "5dc2995ed4a111146567a318",
//"userId": "5db9535b6cc0a817206e9dfb",
//"createdAt": "2019-10-30T09:09:48.003Z",
//"modifiedAt": "2019-10-30T09:09:48.003Z",
//"__v": 0
//},
//"message": "updated successfully"
//}

class UpdateUserModel {
  Updated updated;
  String message;
  String resMsg;

  UpdateUserModel({this.updated, this.message, this.resMsg});

  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    updated =
        json['updated'] != null ? new Updated.fromJson(json['updated']) : null;
    message = json['message'];
    resMsg = 'success';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.updated != null) {
      data['updated'] = this.updated.toJson();
    }
    data['message'] = this.message;
    data['resMsg'] = this.resMsg;
    return data;
  }
}

class Updated {
  Info info;
  String password;
  bool isBlocked;
  bool isLoggedIn;
  String sId;
  String firstName;
  String lastName;
  String role;
  String userId;
  String createdAt;
  String modifiedAt;
  int iV;

  Updated(
      {this.info,
      this.password,
      this.isBlocked,
      this.isLoggedIn,
      this.sId,
      this.firstName,
      this.lastName,
      this.role,
      this.userId,
      this.createdAt,
      this.modifiedAt,
      this.iV});

  Updated.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    password = json['password'];
    isBlocked = json['isBlocked'];
    isLoggedIn = json['isLoggedIn'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    data['password'] = this.password;
    data['isBlocked'] = this.isBlocked;
    data['isLoggedIn'] = this.isLoggedIn;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['role'] = this.role;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Info {
  String email;
  String role;
  String phone;

  Info({this.email, this.role, this.phone});

  Info.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    return data;
  }
}

class UpdateUserErrorModel {
  String error;
  String desc;
  String resMsg;

  UpdateUserErrorModel({this.error, this.desc, this.resMsg});

  UpdateUserErrorModel.fromJson(Map<String, dynamic> json) {
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
