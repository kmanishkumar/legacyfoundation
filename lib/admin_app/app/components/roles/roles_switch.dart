import 'dart:convert';
import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:found_legacy/admin_app/app/components/roles/roles_list.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/create_user.dart';

import 'package:found_legacy/services/api_services.dart';

class RolesSwitch extends StatefulWidget {
  var responseData;

  RolesSwitch({
    this.responseData,
  });

  @override
  _RolesSwitchState createState() => _RolesSwitchState();
}

class _RolesSwitchState extends State<RolesSwitch> {
  ApiService _apiService = ApiService();
  final formkey = GlobalKey<FormState>();
  bool _autoValidate = false;

  bool isAdmin = false;

  bool manageTemplate = false;
  bool manageCategories = false;
  bool manageUsers = false;
  bool manageJobs = false;
  bool manageDocs = false;
  bool manageNotes = false;

  bool defaultCurd = false;

  bool crudTemplate = false;
  bool crudCategory = false;
  bool crudUsers = false;
  bool crudJobs = false;
  bool crudDocs = false;
  bool crudNotes = false;

  var roleName = TextEditingController();
  var roleDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    var res = widget.responseData.toString().split("??")[0];
    print("mnishh");
    print(res);

    var rName = widget.responseData.toString().split("??")[0];
    print(rName);

//    var rId = widget.responseData.toString().split("??")[1];
//    print(rId);

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
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => RolesListScreen())),
        ),
        centerTitle: true,
        title: Text("Roles", style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
//        color: Colors.blue,
//        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
              child: Form(
                key: formkey,
                autovalidate: _autoValidate,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: roleName,
                        autovalidate: false,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        validator: _validateRoleName,

//                        initialValue: widget.responseData.toString().split("??")[0],
                        decoration: InputDecoration(
                            hintText: widget.responseData == null
                                ? "Role Name"
                                : rName,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.black),
                                gapPadding: 1.5),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(width: blockSize * 4),
                    Expanded(
                      child: TextFormField(
                        controller: roleDescription,
                        autovalidate: true,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
//                              labelText: "Role Name"",
//                              labelStyle: TextStyle(color: Colors.black),
                            hintText: "Role Description",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(color: Colors.black),
                                gapPadding: 1.5),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    SizedBox(width: blockSize * 4),
                    GestureDetector(
                      onTap: () => showAlert(
                          // res

                          widget.responseData.toString().split("??")[1]
                      ),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Delete Role',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            Expanded(
                child: Container(
//                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Admin",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to have access to all permissions below",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin,
                                      onChanged: (value) {
                                        setState(() {
                                          isAdmin = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Templates",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
//                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to add, edit, delete, and replace templates",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
//                                  value: manageTemplate,
//                                  onChanged: isAdmin == true
//                                      ? (value) {
//                                          setState(() {
//                                            isAdmin = value;
//                                            manageTemplate = value;
//                                          });
//                                        }
//                                      : null,
                                      value: isAdmin == true || manageTemplate==true
                                          ? manageTemplate = true
                                          : manageTemplate = false,
                                      onChanged: (value) {
                                        setState(() {
                                          print(value);
                                          manageTemplate = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Categories",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to create, edit, and delete categories",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin == true || manageCategories==true
                                          ? manageCategories = true
                                          : manageCategories = false,
                                      onChanged: (value) {

                                        setState(() {
                                          manageCategories = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Users",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to add, edit, and delete other users",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin == true || manageUsers == true
                                          ? manageUsers = true
                                          : manageUsers = false,
                                      onChanged: (value) {
                                        setState(() {
                                          manageUsers = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Jobs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to create new Job IDs and Job descriptions",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin == true || manageJobs == true
                                          ? manageJobs = true
                                          : manageJobs = false,
                                      onChanged: (value) {
                                        setState(() {
                                          manageJobs = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Documents",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Text(
                                      "Allow a user to add, modify, and delete Docs",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin == true || manageDocs == true
                                          ? manageDocs = true
                                          : manageDocs = false,
                                      onChanged: (value) {
                                        setState(() {
                                          manageDocs = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text("Manage Notes",
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Allow a user to add, modify, and delete notes",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Transform.scale(
                                    scale: 1.8,
                                    child: Switch(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: isAdmin == true || manageNotes
                                          ? manageNotes = true
                                          : manageNotes = false,
                                      onChanged: (value) {
                                        setState(() {
                                          manageNotes = value;
                                        });
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: blockSizeVertical * 5,
                            ),
                          ],
                        ),
                      ],
                    ))),
            SizedBox(
              height: blockSizeVertical * 4,
            ),
            GestureDetector(
              onTap: () {
                _validateAndSubmit();
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
                      'Create Role',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff77a8ff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: blockSizeVertical * 4,
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndSubmit() async {
    if (formkey.currentState.validate()) {
      bool toggleAdmin = isAdmin;
      print(toggleAdmin);

      if (isAdmin == true) {
        if (manageTemplate == true) {
          setState(() {
            crudTemplate = manageTemplate;
          });
        }
        if (manageCategories == true) {
          setState(() {
            crudCategory = manageCategories;
          });
        }
        if (manageUsers == true) {
          setState(() {
            crudUsers = manageUsers;
          });
        }
        if (manageJobs == true) {
          setState(() {
            crudJobs = manageJobs;
          });
        }
        if (manageDocs == true) {
          setState(() {
            crudDocs = manageDocs;
          });
        }
        if (manageNotes == true) {
          setState(() {
            crudNotes = manageNotes;
          });
        }
      } else if (isAdmin == false) {
        if (manageTemplate == true) {
          setState(() {
            crudTemplate = manageTemplate;
          });
        }
        if (manageCategories == true) {
          setState(() {
            crudCategory = manageCategories;
          });
        }
        if (manageUsers == true) {
          setState(() {
            crudUsers = manageUsers;
          });
        }
        if (manageJobs == true) {
          setState(() {
            crudJobs = manageJobs;
          });
        }
        if (manageDocs == true) {
          setState(() {
            crudDocs = manageDocs;
          });
        }
        if (manageNotes == true) {
          setState(() {
            crudNotes = manageNotes;
          });
        }
      }

      var roleN = roleName.text;
      print(roleN);
      var roleD = roleDescription.text;
      print(roleD);

      var roleData = {
        "name": roleN,
        "description": roleD,
        "permissions": jsonEncode({
          "admin": isAdmin,
          "manageTemplates": {
            "create": crudTemplate,
            "read": crudTemplate,
            "update": crudTemplate,
            "delete": crudTemplate,
          },
          "manageCategories": {
            "create": crudCategory,
            "read": crudCategory,
            "update": crudCategory,
            "delete": crudCategory,
          },
          "manageUsers": {
            "create": crudUsers,
            "read": crudUsers,
            "update": crudUsers,
            "delete": crudUsers,
          },
          "manageJobs": {
            "create": crudJobs,
            "read": crudJobs,
            "update": crudJobs,
            "delete": crudJobs,
          },
          "manageDocuments": {
            "create": crudDocs,
            "read": crudDocs,
            "update": crudDocs,
            "delete": crudDocs,
          },
          "manageNotes": {
            "create": crudNotes,
            "read": crudNotes,
            "update": crudNotes,
            "delete": crudNotes,
          }
        })
      };

      var response = await _apiService.createRole(roleData);
      print(response);

      if (response.role == null) {
        Flushbar(
          message: response.message,
          icon: Icon(Icons.info_outline),
          duration: Duration(seconds: 5),
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
      } else {
        Flushbar(
          message: response.message,
          icon: Icon(Icons.info_outline),
          duration: Duration(seconds: 5),
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

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => RolesListScreen()));
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  String _validateRoleName(String value) {
    Pattern pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);

    if (roleName.text.isEmpty) {
      return "Role Name is Required";
    } else if (!regExp.hasMatch(roleName.text)) {
      return "Name must be a-z and A-Z";
    } else {
      return null;
    }
  }

  showAlert(value) {
    print(value);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Delete Role"),
            content: new Text("Do you really want to delete?"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  deleteRole(args: value);
                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  void deleteRole({args}) async {
    var data = args;
    print(data);

    var response = await _apiService.deleteRole(data);

    print(response.message);

    if (response.resMsg == 'success') {
      Flushbar(
        message: response.message,
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
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

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => RolesListScreen()));
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "error while deleting role",
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
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
    } else {
      ErrorDescription("Someting went wrong");
    }
  }

  _manageNotes(value) {
    print(value);
    if (isAdmin == true) {
      setState(() {
        isAdmin = value;
        manageNotes = value;
      });
    } else if (isAdmin != true) {
      setState(() {
        isAdmin = false;
        manageNotes = null;
      });
    }
  }
}
