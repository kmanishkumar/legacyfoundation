import 'package:flutter/material.dart';


class DataAdminProvider extends ChangeNotifier{


  String _firstName='a';
  String _lastName='b';
  String _email='a@g.com';
  String _roleId='123';
  String _phone='1234567890';
  String _password  = 'test12345';


  String get firstName=>_firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get roleId => _roleId;
  String get phone => _phone;
  String get password => _password;


  set setFirstName(String val){
    _firstName=val;
    notifyListeners();
  }


  set setLastName(String val){
    _lastName=val;
    notifyListeners();
  }


  set setEmail(String val){
    _email=val;
    notifyListeners();
  }


  set setRoleId(String val){
    _roleId=val;
    notifyListeners();
  }

  set setPhone(String val){
    _phone=val;
    notifyListeners();
  }


  set setPassword(String val){
    _password=val;
    notifyListeners();
  }



}