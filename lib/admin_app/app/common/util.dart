import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminUtil {
  static sharePrefsToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    debugPrint("Token===>1$token");
    return token;
  }

  static sharePrefsUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString('userId');
    debugPrint('UserId===>$userId');
    return userId;
  }

  static Future<String> sharePrefsEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('email');
    return email;
  }
  static Future<String> sharePrefsDocToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('docuSigntoken');
    return email;
  }

  static sharePrefsRoleName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String roleName = preferences.getString('roleName');
    debugPrint('roleName===>$roleName');
    return roleName;
  }

  static Future<String> sharePrefsUserRole() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String roleOfUser = preferences.getString('roleOfUser');
    debugPrint('roleName===>$roleOfUser');
    return roleOfUser;
  }
}
