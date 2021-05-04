// To parse this JSON data, do
//
//     final sendMailModel = sendMailModelFromJson(jsonString);

import 'dart:convert';

SendMailModel sendMailModelFromJson(String str) => SendMailModel.fromJson(json.decode(str));

String sendMailModelToJson(SendMailModel data) => json.encode(data.toJson());

class SendMailModel {
  SendMailModel({
    this.message,
  });

  String message;

  factory SendMailModel.fromJson(Map<String, dynamic> json) => SendMailModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
