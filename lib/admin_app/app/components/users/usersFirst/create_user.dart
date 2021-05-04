import 'package:async_loader/async_loader.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/roles/manage_roles.dart';
import 'package:found_legacy/admin_app/app/components/roles/roles_list.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/admin_app/app/providers/DataProviderAdmin.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/services/dioApiCalls.dart';
import 'package:provider/provider.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class User {
  const User(this.id, this.name);

  final String name;
  final String id;
}

class _CreateUserState extends State<CreateUser> {
  //AllRoles roles;
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      GlobalKey<AsyncLoaderState>();
  final formkey = GlobalKey<FormState>();
  bool _formValidate = false;

  ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
//    _apiService.getCategoryList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

//  var _firstName = TextEditingController();
//
//  var _secondName = TextEditingController();
//
//  var _email = TextEditingController();
//
//  var _roleId = TextEditingController();
//
//  var _phone = TextEditingController();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _secondName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _roleId = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _pass = TextEditingController();

  var roleId;
  bool admin = false;
  bool _isBlocked = false;
  var role;

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

    final dataProvider = Provider.of<DataAdminProvider>(context,listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
//              onPressed: () => Navigator.of(context).pop()
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => UsersListScreen())),
          ),
          centerTitle: true,
          title:
              Text("Create User", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => RolesListScreen())),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.only(right: 30, left: 10),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Manage Roles',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: _statusGap + 10, bottom: 10, left: 50, right: 50),
//            width: double.infinity,
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
//                          color: Colors.red,
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("First Name")),
                        ),
                        Expanded(
                          child: Container(
//                            color: Colors.red,
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              controller: _firstName,
                              validator: _validateFirstName,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
//                          color: Colors.pink,
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Last Name")),
                        ),
                        Expanded(
                          child: Container(
//                            color: Colors.pink,
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              controller: _secondName,
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
//                          color: Colors.green,
                          width: blockSize * 40,
                          margin: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Email")),
                        ),
                        Expanded(
                          child: Container(
//                            color: Colors.green,
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                              validator: _validateEmail,
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
//                            color: Colors.yellow,
//                            height: blockSizeVertical * 10,
//                              width: (blockSize * 75) - 25,
                            width: blockSize * 60,
                            height: blockSizeVertical * 8,
                            padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
//                                   value: dropdownValue,
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
                                        if(newValue == '5e0b58977a8ede03316d029d')
                                        {
                                          admin = true;
                                        }

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
//                            color: Colors.purple,
                            width: blockSize * 60,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
                              controller: _phone,
                              validator: _validatePhoneNo,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      visible: admin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
//                          color: Colors.purple,
                            width: blockSize * 40,
                            margin: EdgeInsets.all(10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Password")),
                          ),
                          Expanded(
                            child: Container(
//                            color: Colors.purple,
                              width: blockSize * 60,
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                // keyboardType: TextInputType.number,
                                controller: _pass,
                                // validator: _validatePhoneNo,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: blockSizeVertical * 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        _validateAndSubmit(dataProvider);
                      },
                      child: SizedBox(
                        width: 140,
                        height: 70,
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create User',
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

  void _validateAndSubmit(DataAdminProvider dataProvider) async {
    if (formkey.currentState.validate()) {
      dataProvider.setFirstName = _firstName.text;
      dataProvider.setLastName = _secondName.text;
      dataProvider.setEmail = _email.text;
      dataProvider.setPhone = _phone.text;
      dataProvider.setPassword = _pass.text;

//      var responses = await _apiService.getAccountDetails();
//      print(responses);

      var userData = {
        "firstName": dataProvider.firstName,
        "lastName": dataProvider.lastName,
        "email": dataProvider.email,
        "role": roleId,
        "phone": dataProvider.phone,
        "password": dataProvider.password
      };

      print("Userdata===>$userData");

      var response = await _apiService.createUser(userData);
      print(response);
      print(response.resMsg);

      if (response.resMsg == 'success') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => UsersListScreen()));
      } else if (response.resMsg == "failure") {
        debugPrint("before flushbar");
        Flushbar(
          message: response.resMsg ?? 'Error occured',
          icon: Icon(Icons.info_outline),
          duration: Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundGradient:
              LinearGradient(colors: [Colors.red, Colors.black]),
          animationDuration: Duration(seconds: 2),
          flushbarStyle: FlushbarStyle.FLOATING,
          borderRadius: 90.0,
          margin: EdgeInsets.all(10),
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
