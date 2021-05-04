//class AuthorizeUserModel {
//  User userAccessToken;
//  String message;
//
//  AuthorizeUserModel({this.userAccessToken, this.message});
//
//  AuthorizeUserModel.fromJson(Map<String, dynamic> json) {
//    userAccessToken = json['userAccessToken'] != null ? new User.fromJson(json['userAccessToken']) : null;
//    message = json['message'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.userAccessToken != null) {
//      data['userAccessToken'] = this.userAccessToken.toJson();
//    }
//    data['message'] = this.message;
//    return data;
//  }
//}
//
//class User {
//  String userAccessToken;
//
//  User({this.userAccessToken});
//
//  User.fromJson(Map<String, dynamic> json) {
//    userAccessToken = json['userAccessToken'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['userAccessToken'] = this.userAccessToken;
//    return data;
//  }
//}



class AuthorizeUserModel {
  String userAccessToken;
  String message;

  AuthorizeUserModel({this.userAccessToken, this.message});

  AuthorizeUserModel.fromJson(Map<String, dynamic> json) {
    userAccessToken = json['userAccessToken'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAccessToken'] = this.userAccessToken;
    data['message'] = this.message;
    return data;
  }
}