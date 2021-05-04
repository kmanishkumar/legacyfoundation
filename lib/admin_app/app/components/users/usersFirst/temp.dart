import 'package:async_loader/async_loader.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/admin_app/app/providers/DataProviderAdmin.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/services/dioApiCalls.dart';
import 'package:provider/provider.dart';

class UpdateUser extends StatefulWidget {
  var responseData;

  UpdateUser({this.responseData});

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class User {
  const User(this.id, this.name);

  final String name;
  final String id;
}

class _UpdateUserState extends State<UpdateUser> {
  //AllRoles roles;
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
  GlobalKey<AsyncLoaderState>();
  final formkey = GlobalKey<FormState>();
  bool _formValidate = false;
  FocusNode firstNameFocus;

  ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    firstNameFocus = FocusNode();
    firstNameFocus.unfocus();
  }

  @override
  void dispose() {
    firstNameFocus.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var _firstName = TextEditingController();
  var _lastName = TextEditingController();
  var _email = TextEditingController();
  var _role = TextEditingController();
  var _phone = TextEditingController();
  var _userId = TextEditingController();
  var _sId = TextEditingController();

  var roleId;
  bool _isBlocked = false;
//  var role;

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await DioService().getAllRoles(),
      renderLoad: () => Center(child: CircularProgressIndicator()),
      renderError: ([error]) => Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: Text(
              'Sorry, there was an error loading your Api',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          )),
      renderSuccess: ({data}) => getCreateUserForm(context, data),
    );
    return SafeArea(child: _asyncLoader);
  }

  getCreateUserForm(context, Response data) {
    List<dynamic> dl = data.data;
    List<String> sl = dl.cast<String>();
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final blockSize = _width / 100;
    final blockSizeVertical = _height / 100;
    final _statusGap = MediaQuery.of(context).padding.top + 10;

    final _dataProvider = Provider.of<DataAdminProvider>(context);

    debugPrint("rsponsedata in editData screeen");
    print(widget.responseData);

    var userData = widget.responseData;

    _firstName.text = userData.firstName;
    _lastName.text = userData.lastName;
    _email.text = userData.info.email;
//    _role.text = userData.role;
    _phone.text = userData.info.phone;
    _userId.text = userData.userId;

    _sId.text = userData.sId;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () => Navigator.of(context).pop()),
          centerTitle: true,
          title: Text("Legacy ", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: _statusGap + 10, bottom: 10, left: 50, right: 50),
              width: blockSize * 200,
              height: blockSizeVertical * 80,
              padding:
              EdgeInsets.only(bottom: 15, top: 15, right: 30, left: 30),
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
              child: Form(
                key: formkey,
                autovalidate: _formValidate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("First Name")),
                        ),
                        Expanded(
                          child: Container(
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              focusNode: firstNameFocus,
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
//                              controller: _firstName,
                              initialValue: _firstName.text,
                              onChanged: (val) {
                                _firstName.text = val;
                              },
                              validator: _validateFirstName,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black))),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Last Name")),
                        ),
                        Expanded(
                          child: Container(
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
//                              controller: _lastName,
                              initialValue: _lastName.text,
                              onChanged: (val) {
                                _lastName.text = val;
                              },
//                              validator: _validateLastName,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black))),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Email")),
                        ),
                        Expanded(
                          child: Container(
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,

//                              controller: _email,
                              initialValue: _email.text,
                              onChanged: (val) {
                                _email.text = val.toString();
                              },
//                              validator: _validateEmail,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black))),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
//                          color: Colors.yellow,
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Role ID")),
                        ),
                        Expanded(
                          child: Container(
//                            height: blockSizeVertical * 10,
//                            color: Colors.green,
                            child: Container(
//                              color: Colors.purple,
//                              width: (blockSize * 95) - 25,
                              width: blockSize * 60,
                              height: blockSizeVertical * 8,
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              foregroundDecoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: Colors.black)),
                              child: SizedBox(
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      canvasColor: Colors.white),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      // value: dropdownValue,
                                      icon: Icon(
                                        Icons.arrow_downward,
                                        color: Colors.black,
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                      underline: Container(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                      value: roleId,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          roleId = newValue;
                                        });
                                      },
                                      items: sl.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value.split('??')[1],
                                          child: Text(value.split('??')[0]),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
//                          color: Colors.purple,
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Phone")),
                        ),
                        Expanded(
                          child: Container(
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
//                              controller: _phone,
                              initialValue: _phone.text,
                              onChanged: (val) {
                                _phone.text = val;
                              },
//                              validator: _validatePhoneNo,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black))),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: blockSizeVertical * 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        _validateAndSubmit(_dataProvider);
                      },
                      child: SizedBox(
                        width: 120,
                        height: 60,
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff77a8ff),
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
        ));
  }

  void _validateAndSubmit(DataAdminProvider _dataAdminProvider) async {
    if (formkey.currentState.validate()) {
      var firstName = _firstName.text;
      var lastName = _lastName.text;
      var email = _email.text;
      var role = roleId;

      var phone = _phone.text;
      var userId = _userId.text;

      if (role != null) {
        var userData = {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "role": role,
          "phone": phone,
          "UserId": userId,
        };
        var idUser = widget.responseData.sId;
        print("Userdata@EditUser ===>$userData");
        var response = await _apiService.updateUser(userData, idUser);
        if (response.resMsg == 'success') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => UsersListScreen()));
        } else if (response.resMsg == "failure") {
          debugPrint("before flushbar");
          Flushbar(
            message: "This email address is already registered",
            icon: Icon(Icons.info_outline),
            duration: Duration(seconds: 5),
            leftBarIndicatorColor: Colors.red,
            flushbarPosition: FlushbarPosition.BOTTOM,
            backgroundGradient:
            LinearGradient(colors: [Colors.red, Colors.black]),
            animationDuration: Duration(seconds: 2),
            flushbarStyle: FlushbarStyle.FLOATING,
            isDismissible: true,
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
        Flushbar(
          message: "Must Include RoleId to Proceed",
          icon: Icon(Icons.info_outline),
          duration: Duration(seconds: 5),
//          leftBarIndicatorColor: Colors.red,,
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

  String _validateFirstName(String value) {
    Pattern pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);

    if (_firstName.text.isEmpty) {
      return "First Name is Required";
    } else if (!regExp.hasMatch(_firstName.text)) {
      return "Name must be a-z and A-Z";
    } else {
      return null;
    }
  }

//  String _validateLastName(String value) {
//    Pattern pattern = r'^[a-zA-Z0-9]+$';
//    RegExp regExp = new RegExp(pattern);
//
//    if (_secondName.text.isEmpty) {
//      return "LastName is Required";
//    } else if (!regExp.hasMatch(_secondName.text)) {
//      return "LastName is not Valid";
//    } else {
//      return null;
//    }
//  }

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

//  String _validatePhoneNo(String value) {
//    Pattern pattern = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
//    RegExp regExp = new RegExp(pattern);
//
//    if (_phone.text.isEmpty) {
//      return "Phone Number is Required";
//    } else if (!regExp.hasMatch(_phone.text)) {
//      return "Enter valid Phone Number";
//    } else {
//      return null;
//    }
//  }

  String _validatePhoneNo(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile Number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}
