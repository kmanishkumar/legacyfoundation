import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/user_app/app/common/Util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpCall {
  var httpRes;
  final JsonDecoder _decoder = new JsonDecoder();

//  static final BASE_URL = "http://167.172.224.130:3000/v0/";
////
  static final URL_Authorize_Token = DotEnv().env['DOCAPIURL'];

  static final BASE_URL = DotEnv().env['APIURL'];

//  static final BASE_URL = "http://192.168.0.176:3000/v0/";

  Future<dynamic> login(String url, {Map<dynamic, dynamic> body}) async {
    print(DotEnv().env);
    httpRes = await http.post(BASE_URL + url,
        body: body, headers: {"Accept": 'application/json'});
    return httpRes;
  }

  Future<dynamic> createCat(String url,{Map<dynamic,dynamic> body}) async{
    final token = await AdminUtil.sharePrefsToken();

    httpRes = await http.post(BASE_URL + url,
        body: body, headers: {"Accept": 'application/json',
          "Authorization": token.toString()
        });
    print('httpRes $httpRes');
  }

  Future<dynamic> sendMail(String url,{Map<dynamic,dynamic> body}) async{
    final token = await AdminUtil.sharePrefsToken();

    httpRes = await http.post(BASE_URL + url,
        body: body, headers: {"Accept": 'application/json',
          "Authorization": token.toString()
        });
    print('httpRes $httpRes');
  }

  Future<dynamic> updateCat(String url,{Map<dynamic,dynamic> body}) async{

    final token = await AdminUtil.sharePrefsToken();

    httpRes = await http.put(BASE_URL + url,
        body: body, headers: {"Accept": 'application/json',
          "Authorization": token.toString()
        });


  }

  Future<dynamic> logout(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.post(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> createUser(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.post(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> updateUser(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.put(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token,
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> authorizeUser(String url,
      {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.post(URL_Authorize_Token + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> getDocuments(String url) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }

  Future<dynamic> getDocumentsDocuSign(String url) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(URL_Authorize_Token + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }

//get Audit Log

  Future<dynamic> getAuditLog(String url) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }


  Future<dynamic> getDocumentsLog(String url) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }




  Future<dynamic> deleteDoc(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.delete(BASE_URL + url, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> getCategoryList(String url,
      {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }

  Future<dynamic> getAccountDetails(String url,
      {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    if (token != null) {
      httpRes = await http.get(BASE_URL + url, headers: {
        "Content-Type": 'application/json',
        "Authorization": token.toString(),
      });
      print('httpRes$httpRes');
      return httpRes;
    } else {
      return Exception('Error occured no token');
    }
  }

  Future<dynamic> getUsersList(String url, {Map<dynamic, dynamic> body}) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    final token = sharedPreferences.getString('token');
//    print(token);

    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }

  Future<dynamic> deleteUser(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
//    print(token);
    httpRes = await http.delete(BASE_URL + url, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> createRole(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.post(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> deleteRole(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    httpRes = await http.delete(BASE_URL + url, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> updateRole(String url, {Map<dynamic, dynamic> body}) async {
    final token = await AdminUtil.sharePrefsToken();
    print(token);
    httpRes = await http.put(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token,
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  /***
   * User App HTTP Calls
   * */

  Future<dynamic> createNote(String url, {Map<dynamic, dynamic> body}) async {
    final token = await UserUtil.sharePrefsToken();
//    print(token);
    httpRes = await http.post(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> getNotesByUserId(String url,
      {Map<dynamic, dynamic> body}) async {
    final token = await UserUtil.sharePrefsToken();
    httpRes = await http.get(BASE_URL + url, headers: {
      "Content-Type": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes$httpRes');
    return httpRes;
  }

  Future<dynamic> updateNote(String url, {Map<dynamic, dynamic> body}) async {
    final token = await UserUtil.sharePrefsToken();
//    print(token);
    httpRes = await http.put(BASE_URL + url, body: body, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }

  Future<dynamic> deleteNote(String url, {Map<dynamic, dynamic> body}) async {
    final token = await UserUtil.sharePrefsToken();
//    print(token);
    httpRes = await http.delete(BASE_URL + url, headers: {
      "Accept": 'application/json',
      "Authorization": token.toString(),
    });
    print('httpRes $httpRes');
    return httpRes;
  }
}
