//class LoginModel {
//  String token;
//  String sId;
//  String message;
//
//  LoginModel({this.token, this.sId, this.message});
//
//  LoginModel.fromJson(Map<String, dynamic> json) {
//    token = json['token'];
//    sId = json['_id'];
//    message = 'success';
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['token'] = this.token;
//    data['_id'] = this.sId;
//    data['message'] = this.message;
//    return data;
//  }
//}

class LoginModel {
  String token;
  String sId;
  Role role;
  String message;
  String docuSigntoken;


  LoginModel(this.token, this.sId, this.role, this.message, this.docuSigntoken);

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    sId = json['_id'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    message = 'success';
    docuSigntoken=json['docuSignToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['_id'] = this.sId;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    data['message'] = this.message;
    data['docuSigntoken']=this.docuSigntoken;
    return data;
  }
}

class Role {
  Permissions permissions;
  String sId;
  String userId;
  String name;
  String description;
  String createdAt;
  String modifiedAt;
  int iV;

  Role(
      {this.permissions,
      this.sId,
      this.userId,
      this.name,
      this.description,
      this.createdAt,
      this.modifiedAt,
      this.iV});

  Role.fromJson(Map<String, dynamic> json) {
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    description = json['description'];
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
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Permissions {
  ManageTemplates manageTemplates;
  ManageTemplates manageCategories;
  ManageTemplates manageUsers;
  ManageTemplates manageJobs;
  ManageTemplates manageDocuments;
  ManageTemplates manageNotes;
  bool admin;

  Permissions(
      {this.manageTemplates,
      this.manageCategories,
      this.manageUsers,
      this.manageJobs,
      this.manageDocuments,
      this.manageNotes,
      this.admin});

  Permissions.fromJson(Map<String, dynamic> json) {
    manageTemplates = json['manageTemplates'] != null
        ? new ManageTemplates.fromJson(json['manageTemplates'])
        : null;
    manageCategories = json['manageCategories'] != null
        ? new ManageTemplates.fromJson(json['manageCategories'])
        : null;
    manageUsers = json['manageUsers'] != null
        ? new ManageTemplates.fromJson(json['manageUsers'])
        : null;
    manageJobs = json['manageJobs'] != null
        ? new ManageTemplates.fromJson(json['manageJobs'])
        : null;
    manageDocuments = json['manageDocuments'] != null
        ? new ManageTemplates.fromJson(json['manageDocuments'])
        : null;
    manageNotes = json['manageNotes'] != null
        ? new ManageTemplates.fromJson(json['manageNotes'])
        : null;
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.manageTemplates != null) {
      data['manageTemplates'] = this.manageTemplates.toJson();
    }
    if (this.manageCategories != null) {
      data['manageCategories'] = this.manageCategories.toJson();
    }
    if (this.manageUsers != null) {
      data['manageUsers'] = this.manageUsers.toJson();
    }
    if (this.manageJobs != null) {
      data['manageJobs'] = this.manageJobs.toJson();
    }
    if (this.manageDocuments != null) {
      data['manageDocuments'] = this.manageDocuments.toJson();
    }
    if (this.manageNotes != null) {
      data['manageNotes'] = this.manageNotes.toJson();
    }
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

class LoginError {
  String message;

  LoginError({this.message});

  LoginError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

class LogoutModel {
  String message;

  LogoutModel({this.message});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
