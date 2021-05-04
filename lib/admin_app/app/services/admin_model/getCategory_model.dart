/**
 * Get Category Model
 * **/

class CategoryList {
  List<Categories> categories;
  String message;

  CategoryList({this.categories, this.message});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Categories {
  String sId;
  String name;
  String description;
  String userId;
  String createdAt;
  int iV;

  Categories(
      {this.sId,
      this.name,
      this.description,
      this.userId,
      this.createdAt,
      this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

/*
 * Get Category Model
 **/

class CategoryListError {
  String error;
  String desc;

  CategoryListError({this.error, this.desc});

  CategoryListError.fromJson(Map<String, dynamic> json) {
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
