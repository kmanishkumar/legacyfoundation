// To parse this JSON data, do
//
//     final getAllUsers = getAllUsersFromJson(jsonString);

import 'dart:convert';

GetAllUsers getAllUsersFromJson(String str) => GetAllUsers.fromJson(json.decode(str));

String getAllUsersToJson(GetAllUsers data) => json.encode(data.toJson());

class GetAllUsers {
  List<User> user;
  String message;

  GetAllUsers({
    this.user,
    this.message,
  });

  factory GetAllUsers.fromJson(Map<String, dynamic> json) => GetAllUsers(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
    "message": message,
  };
}

class User {
  Info info;
  String password;
  bool isBlocked;
  bool isLoggedIn;
  String id;
  String firstName;
  String lastName;
  String role;
  String userId;
  DateTime createdAt;
  DateTime modifiedAt;
  int v;

  User({
    this.info,
    this.password,
    this.isBlocked,
    this.isLoggedIn,
    this.id,
    this.firstName,
    this.lastName,
    this.role,
    this.userId,
    this.createdAt,
    this.modifiedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    info: Info.fromJson(json["info"]),
    password: json["password"],
    isBlocked: json["isBlocked"],
    isLoggedIn: json["isLoggedIn"],
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "password": password,
    "isBlocked": isBlocked,
    "isLoggedIn": isLoggedIn,
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "__v": v,
  };
}

class Info {
  String email;
  Role role;
  String phone;

  Info({
    this.email,
    this.role,
    this.phone,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    email: json["email"],
    role: Role.fromJson(json["role"]),
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "role": role.toJson(),
    "phone": phone,
  };
}

class Role {
  Permissions permissions;
  String id;
  String userId;
  String name;
  String description;
  DateTime createdAt;
  DateTime modifiedAt;
  int v;

  Role({
    this.permissions,
    this.id,
    this.userId,
    this.name,
    this.description,
    this.createdAt,
    this.modifiedAt,
    this.v,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    permissions: Permissions.fromJson(json["permissions"]),
    id: json["_id"],
    userId: json["userId"],
    name: json["name"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    modifiedAt: DateTime.parse(json["modifiedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "permissions": permissions.toJson(),
    "_id": id,
    "userId": userId,
    "name": name,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "modifiedAt": modifiedAt.toIso8601String(),
    "__v": v,
  };
}

class Permissions {
  Manage manageTemplates;
  Manage manageCategories;
  Manage manageUsers;
  Manage manageJobs;
  Manage manageDocuments;
  Manage manageNotes;
  bool admin;

  Permissions({
    this.manageTemplates,
    this.manageCategories,
    this.manageUsers,
    this.manageJobs,
    this.manageDocuments,
    this.manageNotes,
    this.admin,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    manageTemplates: Manage.fromJson(json["manageTemplates"]),
    manageCategories: Manage.fromJson(json["manageCategories"]),
    manageUsers: Manage.fromJson(json["manageUsers"]),
    manageJobs: Manage.fromJson(json["manageJobs"]),
    manageDocuments: Manage.fromJson(json["manageDocuments"]),
    manageNotes: Manage.fromJson(json["manageNotes"]),
    admin: json["admin"],
  );

  Map<String, dynamic> toJson() => {
    "manageTemplates": manageTemplates.toJson(),
    "manageCategories": manageCategories.toJson(),
    "manageUsers": manageUsers.toJson(),
    "manageJobs": manageJobs.toJson(),
    "manageDocuments": manageDocuments.toJson(),
    "manageNotes": manageNotes.toJson(),
    "admin": admin,
  };
}

class Manage {
  bool create;
  bool read;
  bool update;
  bool delete;

  Manage({
    this.create,
    this.read,
    this.update,
    this.delete,
  });

  factory Manage.fromJson(Map<String, dynamic> json) => Manage(
    create: json["create"],
    read: json["read"],
    update: json["update"],
    delete: json["delete"],
  );

  Map<String, dynamic> toJson() => {
    "create": create,
    "read": read,
    "update": update,
    "delete": delete,
  };
}
