import 'dart:core';

import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/admin_app/app/components/users/user_details.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getAccountDetails_model.dart';

import 'package:found_legacy/services/api_services.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  ApiService _apiService = ApiService();

  User _userDetails;
  User get userDetails => _userDetails;
  SharedPreferences sharedPreferences;

  LoginProvider() {
    getCredToken();
  }

  String _email = 'abc@gmail.com';
  String get email => _email;
  set setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  String _password = "abcd";
  String get password => _password;

  set setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  String _token = "abcd";
  String get token => _token;

  set setToken(String value) {
    _token = value;
    notifyListeners();
  }

  String _userId = "abcd";
  String get userId => _userId;

  set setUserId(String value) {
    _userId = value;
    setUserDetails(_userId);
    notifyListeners();
  }

  getCredToken() async {
    _token = await AdminUtil.sharePrefsToken();

    _userId = await AdminUtil.sharePrefsUserId();

    if (_userId != null) {
      setUserDetails(_userId);
    }
    notifyListeners();
  }

  setUserDetails(userId) async {
    var userDetail = await _apiService.getAccountDetails(userId);
    _userDetails = userDetail.user;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('userDetails', _userDetails.toString());
    sharedPreferences.getString("userDetails");
    notifyListeners();
//    Logger().i(sharedPreferences.getString("userDetails"));
  }
}
