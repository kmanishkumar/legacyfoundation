import 'dart:core';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/CustomWidget.dart';

import 'package:found_legacy/admin_app/main.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';

import 'package:found_legacy/user_app/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitiateLogin extends StatefulWidget {
  @override
  _InitiateLoginState createState() => _InitiateLoginState();
}

class _InitiateLoginState extends State<InitiateLogin> {
  final formkey = GlobalKey<FormState>();

  bool _isSelected = false;

  bool _obscureText = true;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool checkValue = true;
  SharedPreferences sharedPreferences;

  bool _formValidate = false;

  bool visiblePasswordField = false;

  bool loginText = true;

  bool radioButtonIcon = false;

  bool showPasswordText = false;

  bool loginButton = false;

  String token;
  String userId;

//  String roleName="Admin";

  String roleName;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
      _obscureText = !_obscureText;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 20.0,
        height: 20.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  @override
  void initState() {
//    getCredential();
    super.initState();
//    getCredential();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.red, Colors.black],
  ).createShader(Rect.fromLTWH(140.0, 100.0, 120.0, 140.0));

  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    final loginProvider = Provider.of<LoginProvider>(context,listen: false);

    final _logo = Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      alignment: Alignment.center,
      child: Image.asset(
        'images/logo.png',
        height: 50,
        fit: BoxFit.fill,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.passthrough,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                  child: Form(
                    key: formkey,
                    autovalidate: _formValidate,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          _logo,
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
//                              width: double.infinity,
                              width: _width > 600
                                  ? blockSize * 60
                                  : blockSize * 100,
                              margin: EdgeInsets.only(top: blockSize * 10),
//                              height: blockSizeVertical * 50,
                              height: blockSizeVertical * 70,
                              padding: EdgeInsets.only(
                                  bottom: 15, top: 15, right: 24, left: 24),
//                              margin: EdgeInsets.only(left: 30,right: 30,top: 15,bottom: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 15.0),
                                        blurRadius: 15.0),
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, -10.0),
                                        blurRadius: 10.0),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0, right: 15.0, top: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("LOGIN",
                                        style: TextStyle(
                                            fontSize: 20, letterSpacing: 2)),
                                    SizedBox(
                                      height: blockSizeVertical * 5,
                                    ),
                                    TextFormField(
                                      controller: _email,
                                      validator: _validateEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              gapPadding: 1.5),
                                          contentPadding: EdgeInsets.all(20)),
                                    ),
                                    SizedBox(
                                      height: blockSizeVertical * 3,
                                    ),
                                    visiblePasswordField
                                        ? TextFormField(
                                            controller: _password,
                                            validator: _validatePassword,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.black),
                                            obscureText: _obscureText,
                                            decoration: InputDecoration(
                                              labelText: "Password",
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              contentPadding:
                                                  EdgeInsets.all(20),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                  gapPadding: 20),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: blockSizeVertical * 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
//                                      mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 12.0,
                                            ),
                                            GestureDetector(
                                              onTap: _radio,
                                              child: radioButtonIcon
                                                  ? radioButton(_isSelected)
                                                  : Container(),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            if (radioButtonIcon)
                                              Text(
                                                "Show Password",
                                                style: TextStyle(fontSize: 10),
                                              )
                                          ],
                                        ),
                                        loginText
                                            ? GestureDetector(
                                                child: Text(
                                                  "Admin login",
                                                  style: TextStyle(
                                                    foreground: Paint()
                                                      ..shader = linearGradient,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                onTap: () {
                                                  _toggleChanges();
                                                },
                                              )
                                            : GestureDetector(
                                                child: Text(
                                                  "User login",
                                                  style: TextStyle(
                                                    foreground: Paint()
                                                      ..shader = linearGradient,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                onTap: () {
                                                  _toggleBack();
                                                },
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: blockSizeVertical * 5,
                                    ),
                                    Center(
                                      child: InkWell(
                                        child: Container(
                                          width: blockSize * 25,
                                          height: blockSizeVertical * 5,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.red,
                                                Colors.black,
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0xFF6078ea)
                                                        .withOpacity(.3),
                                                    offset: Offset(0.0, 8.0),
                                                    blurRadius: 8.0)
                                              ]),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () => _validateAndSubmit(
                                                  loginProvider),
                                              child: Center(
                                                child: Text("Login",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        letterSpacing: 1.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateAndSubmit(LoginProvider loginProvider) async {
    if (formkey.currentState.validate()) {
      String email = loginProvider.setEmail = _email.text;
      print(email);

      String password = loginProvider.setPassword = _password.text;
      print(password);

      if (email.isNotEmpty && password.isEmpty) {
        setState(() {
          roleName = "User";
        });
      } else if (email.isNotEmpty && password.isNotEmpty) {
        setState(() {
          roleName = "Admin";
        });
      }
      var loginData = {"email": email, "password": password};
      var res = await _apiService.login(loginData);

      if (res != null && res.message == 'success') {
        // store token in shared preferences
        String token = res.token;
        String docuSigntoken=res.docuSigntoken;

        String tokenProvider = loginProvider.setToken = token;
        print(tokenProvider);




        var userId = res.sId;
        String userIdProvid = loginProvider.setUserId = userId;
        print(userIdProvid);

//        var roleOfUser = res.role;
//        print(roleOfUser);

        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('email', email);
        sharedPreferences.setString('password', password);
        sharedPreferences.setString('token', token);
        sharedPreferences.setString('userId', userId);
        sharedPreferences.setString("roleName", roleName);
        sharedPreferences.setString('docuSigntoken', docuSigntoken);
//        sharedPreferences.setString("roleOfUser", roleOfUser);

//        getCredential();

        if (token.isNotEmpty) {
          if (email.isNotEmpty &&
              password
                  .isEmpty) //if email is not empty and password field is empty it should navigate to UserApp for our Understanding
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => UserApp(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => AdminApp(),
              ),
            );
          }
        }
      } else {
        Flushbar(
          message: 'Invalid credentials',
          maxWidth: 350,
          icon: Icon(Icons.info_outline),
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundGradient:
              LinearGradient(colors: [Colors.red, Colors.black]),
          animationDuration: Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.FLOATING,
          isDismissible: true,
          borderRadius: 90.0,
          margin: EdgeInsets.all(10),
          boxShadows: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(0.2, 1.8)),
          ],
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        )..show(context);
      }
    } else {
      _formValidate = true;
    }
  }








  String _validateEmail(String _email) {
    Pattern pattern = r'[^@]+@[^\.]+\..+';
    RegExp regExp = new RegExp(pattern);

    if (_email.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(_email)) {
      return "Email is not Valid";
    } else {
      return null;
    }
  }

  String _validatePassword(String _password) {
    print(_password);
    if (_password.length == 0)
      return 'Password is required';
    else if (_password.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  void _toggleChanges() {
    setState(() {
      visiblePasswordField = true;
      loginText = false;
      radioButtonIcon = true;
      showPasswordText = true;
      loginButton = true;
    });
  }

  void _toggleBack() {
    setState(() {
      visiblePasswordField = false;
      loginText = true;
      radioButtonIcon = false;
      showPasswordText = false;
      loginButton = false;
    });
  }

//  void getCredential() async {
//    sharedPreferences = await SharedPreferences.getInstance();
//
//    _email.text = sharedPreferences.getString('email');
//    _password.text = sharedPreferences.getString('password');
//    token = sharedPreferences.getString('token');
//    userId = sharedPreferences.getString('userId');
//    debugPrint('token => $token');
//    debugPrint('userId ==>$userId');
//
//    if (token == null) {
//       Navigator.pushReplacement(
////            context, MaterialPageRoute(builder: (_) => AdminApp()));
//    } else if (token.isNotEmpty) {
//      if (_email.text.isNotEmpty &&
//          _password.text
//              .isEmpty) //if email is not empty and password field is empty it should navigate to UserApp for our Understanding
//      {
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (_) => UserApp()));
//      } else {
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (_) => AdminApp()));
//      }
//    } else {
//      Navigator.pushReplacement(
////            context, MaterialPageRoute(builder: (_) => AdminApp()));
//    }
//  }
}
