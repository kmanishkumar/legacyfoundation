import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUtil {
  static sharePrefsToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    debugPrint("Token===>$token");
    return token;
  }

  static sharePrefsUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString('userId');
    debugPrint('UserId===>$userId');
    return userId;
  }
}
