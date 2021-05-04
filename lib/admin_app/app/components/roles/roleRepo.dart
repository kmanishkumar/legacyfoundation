import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:found_legacy/CustomWidget.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';

class RoleRepo extends ChangeNotifier{

 static deleteContact({args}) async {
    final _apiCall = RestClient(DioClient.getDio());
    final token = await AdminUtil.sharePrefsToken();
    return await _apiCall.deleteRole(token, args).then((value) {
      return null;
    }).catchError((err) {
      throw err;
    });
  }
//  static sendMail(String email, String content) async {
//    final _apiCall = RestClient(DioClient.getDio());
//    final token = await AdminUtil.sharePrefsDocToken();
//    print(token);
//    Map map = {
//      "email": email,
//      "note": content
//    };
// print(map);
//    return await _apiCall.sendMail(token,json.encode(map)).then((value) {
//      print(value);
//
//      // CustomWidgets.showSuccessFlushBar(context, "Notes send to You mail");
//      return value;
//
//    }).catchError((err) {
//      print("error");
//    });
//  }



}