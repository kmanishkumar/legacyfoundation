/**
 * Admin App
 * */

/**
 * UserList Details
 * */

//import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable()
class UsersList {
  List<User> user;
  String message;

  UsersList({this.user, this.message});

  UsersList.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = new List<User>();
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.map((v) => v.toJson()).toList();
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
  Role role;
  String phone;

  Info({this.email, this.role, this.phone});

  Info.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    data['phone'] = this.phone;
    return data;
  }
}

class Role {
  Permissions permissions;
  String sId;
  String name;
  String description;
  String userId;
  String createdAt;
  String modifiedAt;
  int iV;

  Role(
      {this.permissions,
      this.sId,
      this.name,
      this.description,
      this.userId,
      this.createdAt,
      this.modifiedAt,
      this.iV});

  Role.fromJson(Map<String, dynamic> json) {
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.permissions != null) {
      data['permissions'] = this.permissions.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Permissions {
  ManageTemplates manageTemplates;
//  ManageCategories manageCategories;
//  ManageUsers manageUsers;
//  ManageJobs manageJobs;
//  ManageDocuments manageDocuments;
  bool admin;

  Permissions(
      {this.manageTemplates,
//        this.manageCategories,
//        this.manageUsers,
//        this.manageJobs,
//        this.manageDocuments,
      this.admin});

  Permissions.fromJson(Map<String, dynamic> json) {
    manageTemplates = json['manageTemplates'] != null
        ? new ManageTemplates.fromJson(json['manageTemplates'])
        : null;
//    manageCategories = json['manageCategories'] != null
//        ? new ManageCategories.fromJson(json['manageCategories'])
//        : null;
//    manageUsers = json['manageUsers'] != null
//        ? new ManageUsers.fromJson(json['manageUsers'])
//        : null;
//    manageJobs = json['manageJobs'] != null
//        ? new ManageJobs.fromJson(json['manageJobs'])
//        : null;
//    manageDocuments = json['manageDocuments'] != null
//        ? new ManageDocuments.fromJson(json['manageDocuments'])
//        : null;
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.manageTemplates != null) {
      data['manageTemplates'] = this.manageTemplates.toJson();
    }
//    if (this.manageCategories != null) {
//      data['manageCategories'] = this.manageCategories.toJson();
//    }
//    if (this.manageUsers != null) {
//      data['manageUsers'] = this.manageUsers.toJson();
//    }
//    if (this.manageJobs != null) {
//      data['manageJobs'] = this.manageJobs.toJson();
//    }
//    if (this.manageDocuments != null) {
//      data['manageDocuments'] = this.manageDocuments.toJson();
//    }
    data['admin'] = this.admin;
    return data;
  }
}

class ManageTemplates {
  bool create;
  bool read;
  bool update;
  bool delete;

  ManageTemplates({this.create, this.read, this.update, this.delete});

  ManageTemplates.fromJson(Map<String, dynamic> json) {
    create = json['create'];
    read = json['read'];
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create'] = this.create;
    data['read'] = this.read;
    data['update'] = this.update;
    data['delete'] = this.delete;
    return data;
  }
}

/**
 * UserList Error Model
 * */

class UsersListError {
  String error;
  String desc;

  UsersListError({this.error, this.desc});

  UsersListError.fromJson(Map<String, dynamic> json) {
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
