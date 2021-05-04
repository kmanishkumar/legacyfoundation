//{
//"note": {
//"_id": "5dca43a9eacf5d3cf6c5ce46",
//"userId": "5dca2b277c96aa47a37a7978",
//"title": "First",
//"content": "Note",
//"createdAt": "2019-11-12T05:31:21.142Z",
//"modifiedAt": "2019-11-12T05:31:21.143Z",
//"__v": 0
//},
//"message": "successfully created a note "
//}

class CreateNoteModel {
  Note note;
  String message;
  String resMsg;

  CreateNoteModel({this.note, this.message, this.resMsg});

  CreateNoteModel.fromJson(Map<String, dynamic> json) {
    note = json['note'] != null ? new Note.fromJson(json['note']) : null;
    message = json['message'];
    resMsg = 'success';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.note != null) {
      data['note'] = this.note.toJson();
    }
    data['message'] = this.message;
    data['resMsg'] = this.resMsg;

    return data;
  }
}

class Note {
  String sId;
  String userId;
  String title;
  String content;
  String createdAt;
  String modifiedAt;
  int iV;

  Note(
      {this.sId,
      this.userId,
      this.title,
      this.content,
      this.createdAt,
      this.modifiedAt,
      this.iV});

  Note.fromJson(Map<String, dynamic> json) {
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

class CreateNoteErrorModel {
  String error;
  String desc;
  String resMsg;

  CreateNoteErrorModel({this.error, this.desc, this.resMsg});

  CreateNoteErrorModel.fromJson(Map<String, dynamic> json) {
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
