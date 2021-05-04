import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/authorizeUser_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/createRole_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/createUser_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/delete_doc.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/delete_user.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/docuSign_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/documents_log_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/editRole_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getAccountDetails_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getCategory_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getDocuments_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/updateUser_model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/userList_model.dart';
import 'package:found_legacy/models/sendMailModel.dart';
import 'package:found_legacy/services/http_call.dart';
import 'package:found_legacy/services/models.dart';
import 'package:found_legacy/user_app/app/common/Util.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';
import 'package:found_legacy/user_app/app/services/user_model/create_note_model.dart';
import 'package:found_legacy/user_app/app/services/user_model/delete_note_model.dart';
import 'package:found_legacy/user_app/app/services/user_model/getNotesByUserId_model.dart';
import 'package:provider/provider.dart';

class ApiService {
  HttpCall _httpCall = HttpCall();
  final JsonDecoder _decoder = new JsonDecoder();
  var statusCode;
  var convertedResponse;
  
  
  Future createCat(data){

    return _httpCall.createCat("create-category", body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = json.decode(res.body);
      print(convertedResponse);

      if (statusCode == 201) {
        return LoginModel.fromJson(convertedResponse);
      } else {
        return LoginError.fromJson(convertedResponse);
      }
    }).catchError((err) => print("error"));
  }
  
  Future updateCat(String id,data){
    
    return _httpCall.updateCat('update-category/$id',body: data).then((res) async{

      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201) {
        return LoginModel.fromJson(convertedResponse);
      } else {
        return LoginError.fromJson(convertedResponse);
      }
    }).catchError((err){

    });
    
  }

  Future login(data) {
    return _httpCall.login("login", body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = json.decode(res.body);
      print(convertedResponse);

      if (statusCode == 201) {
        return LoginModel.fromJson(convertedResponse);
      } else {
        return LoginError.fromJson(convertedResponse);
      }
    }).catchError((err) => print("error"));
  }

  Future senMail(data) {
    return _httpCall.sendMail("send-note-in-email", body: data).then((res) async {
      print(res.message);
      statusCode = res.statusCode;
      convertedResponse = json.decode(res.body);
      print(convertedResponse);

      if (statusCode == 200) {
        return SendMailModel.fromJson(convertedResponse);
      } else {
        return SendMailModel.fromJson(convertedResponse);
      }
    }).catchError((err) => print("error"));
  }

  Future logout(data) async {
    return _httpCall.logout("logout", body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201) {
        return LogoutModel.fromJson(convertedResponse);
      } else {
        return LogoutModel.fromJson(convertedResponse);
      }
    }).catchError((err) => print("error"));
  }

  Future createUser(data) {
    return _httpCall.createUser("create-user", body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return CreateUserModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = CreateUserErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future updateUser(data, sId) async {
    print(data);

    print(sId);

    return _httpCall
        .updateUser('update-user/$sId', body: data)
        .then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return UpdateUserModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = UpdateUserErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future authorizeUser() async {
    //      "appToken":
//          "ZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmZhV1FpT2lJMVpHVXdaVEF4TURVME1XSTRNVGMzWXpVNE5EY3lOR1lpTENKdVlXMWxJam9pYzJGdGNHeGxJR0Z3Y0NJc0ltUmxjMk55YVhCMGFXOXVJam9pYzJGdGNHeGxJR0Z3Y0NCa1pYTmphWEJ5YVc5dUlpd2lkMlZpU0c5dmExVnliQ0k2SW1GaVl5NXBiaUlzSW1OeVpXRjBaV1JCZENJNklqSXdNVGt0TVRFdE1qbFVNRGs2TURnNk16SXVORFkzV2lJc0ltMXZaR2xtYVdWa1FYUWlPaUl5TURFNUxURXhMVEk1VkRBNU9qQTRPak15TGpRMk4xb2lMQ0pmWDNZaU9qQXNJbWxoZENJNk1UVTNOVEF4T0RVeE1pd2lZWFZrSWpvaWJHVm5ZV041SUdKMWFXeGtaWEp6SWl3aWFYTnpJam9pV21saWRHVnJSRzlqZFZOcFoyNGlMQ0p6ZFdJaU9pSnpZVzF3YkdVZ1lYQndJbjAuMlVRbEIwT3BaZktDa1hvQkNKT3F5Z213d1VZVDBFRTBIbk1lSkR1bGxiUQ==",
    final email = await AdminUtil.sharePrefsEmail();
    final docToken = await AdminUtil.sharePrefsDocToken();
    return  {
      "email": email,
      "docToken" :docToken,
    };
  }

  Future getDocuments() async {
    return _httpCall.getDocuments('documentTemplate').then((res) async {
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);
      if (statusCode == 201 || statusCode == 200) {
        return GetDocumentsModel.fromJson(convertedResponse);
      } else {
        return GetDocumentsModel.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future getDocumentDocuSign() async {
//    final UserId = await AdminUtil.sharePrefsUserId();
    var appId = "5de4cbc792942357e9d1b060";

    return _httpCall.getDocumentsDocuSign('documents/$appId').then((res) async {
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);
      if (statusCode == 201 || statusCode == 200) {
        return GetDocuSignModel.fromJson(convertedResponse);
      } else {
        return GetDocuSignModel.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  //get Audit Log

  Future getAuditLog() async {
    final UserId = await AdminUtil.sharePrefsUserId();

    return _httpCall.getAuditLog('auditlogs/$UserId').then((res) async {
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);
      if (statusCode == 201 || statusCode == 200) {
        return GetDocumentsModel.fromJson(convertedResponse);
      } else {
        return GetDocumentsModel.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future getDocumentsLogs(String val) async {
    return _httpCall
        .getDocumentsLog('auditlogs?filter={"type":"$val"}')
        .then((res) async {
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);
      if (statusCode == 201 || statusCode == 200) {
        return GetDocumentsLog.fromJson(convertedResponse);
      } else {
        return GetDocumentsLog.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future deleteDoc(data) async {
    print("datatataaa $data");

    return _httpCall.deleteDoc('delete-document/$data').then((res) {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return DeleteDocModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = DeleteDocErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future getCategoryList() {
    return _httpCall.getCategoryList('categories').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201 || statusCode == 200) {
        return CategoryList.fromJson(convertedResponse);
      } else {
        return CategoryListError.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future getAccountDetails(userId) async {
    return _httpCall.getAccountDetails('user-info/$userId').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201 || statusCode == 200) {
        return GetAccountDetails.fromJson(convertedResponse);
      } else {
        return GetAccountDetailsError.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future getUserList() async {
//    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//    final userId=sharedPreferences.getString('userId');
//    print(userId);

    return _httpCall.getUsersList('users').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201 || statusCode == 200) {
        return UsersList.fromJson(convertedResponse);
      } else {
        return UsersListError.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future deleteUser(data) async {
    print("datatataaa $data");

    return _httpCall
        .deleteUser(
      'delete-user/$data',
    )
        .then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return DeleteUserModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = DeleteNoteErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future createRole(data) {
    return _httpCall.createRole('create-role', body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return CreateRoleModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = CreateRoleModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future deleteRole(data) async {
    print("datatataaa $data");

    return _httpCall.deleteRole('delete-role/$data').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return DeleteUserModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = DeleteNoteErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future updateRole(data, sId) async {
    print(data);

    print(sId);

    return _httpCall
        .updateRole('update-role/$sId', body: data)
        .then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return EditRoleModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = EditRoleModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  /****
   * User App API Services
   * */

  Future createNote(data) {
    return _httpCall.createNote('create-note', body: data).then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return CreateNoteModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = CreateUserErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future getNotesByUserId() async {
    final userId = await UserUtil.sharePrefsUserId();
    print(userId);

    return _httpCall.getNotesByUserId('notes?userId=$userId').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print(convertedResponse);

      if (statusCode == 201 || statusCode == 200) {
        return GetNotesByUserId.fromJson(convertedResponse);
      } else {
        return GetNotesByUserId.fromJson(convertedResponse);
      }
    }).catchError((err) {
      debugPrint("Error$err");
    });
  }

  Future updateNote(data, noteId) async {
    print("NOTEID+++ $noteId");

    final userId = await UserUtil.sharePrefsUserId();
    print(userId);
    return _httpCall
        .updateNote('update-note/$noteId', body: data)
        .then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return UpdateUserModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = UpdateUserErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }

  Future deleteNote(data) async {
    final userId = await UserUtil.sharePrefsUserId();
    print(userId);

    print("datatataaa $data");

    return _httpCall.deleteNote('delete-note/$data').then((res) async {
      print(res);
      statusCode = res.statusCode;
      convertedResponse = _decoder.convert(res.body);
      print("The Converted Response is==>$convertedResponse");

      if (statusCode == 201 || statusCode == 200) {
        return DeleteNoteModel.fromJson(convertedResponse);
      } else {
        var onlyResponse = DeleteNoteErrorModel.fromJson(convertedResponse);
        print(onlyResponse);
        return onlyResponse;
      }
    }).catchError((err) => print("error"));
  }
}
