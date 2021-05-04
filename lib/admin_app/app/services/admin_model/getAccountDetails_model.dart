/**
 * Get Account Details Model
 **/

class GetAccountDetails {
  User user;
  String message;

  GetAccountDetails({this.user, this.message});

  GetAccountDetails.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

//getAccountDetailsError

/**
 * Get Account Details Model
 **/

class GetAccountDetailsError {
  String error;
  String desc;

  GetAccountDetailsError({this.error, this.desc});

  GetAccountDetailsError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['desc'] = this.desc;
    return data;
  }
}
