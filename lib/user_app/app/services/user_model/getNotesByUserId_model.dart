class GetNotesByUserId {
  List<Notes> notes;
  String message;

  GetNotesByUserId({this.notes, this.message});

  GetNotesByUserId.fromJson(Map<String, dynamic> json) {
    if (json['notes'] != null) {
      notes = new List<Notes>();
      json['notes'].forEach((v) {
        notes.add(new Notes.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notes != null) {
      data['notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Notes {
  String sId;
  String userId;
  String title;
  String content;
  String createdAt;
  String modifiedAt;
  int iV;

  Notes(
      {this.sId,
        this.userId,
        this.title,
        this.content,
        this.createdAt,
        this.modifiedAt,
        this.iV});

  Notes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['__v'] = this.iV;
    return data;
  }
}