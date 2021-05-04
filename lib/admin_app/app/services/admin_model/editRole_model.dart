class EditRoleModel {
  Updated updated;
  String message;

  EditRoleModel({this.updated, this.message});

  EditRoleModel.fromJson(Map<String, dynamic> json) {
    updated =
    json['updated'] != null ? new Updated.fromJson(json['updated']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.updated != null) {
      data['updated'] = this.updated.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Updated {
  Permissions permissions;
  String sId;
  String name;
  String description;
  String userId;
  String createdAt;
  String modifiedAt;
  int iV;

  Updated(
      {this.permissions,
        this.sId,
        this.name,
        this.description,
        this.userId,
        this.createdAt,
        this.modifiedAt,
        this.iV});

  Updated.fromJson(Map<String, dynamic> json) {
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