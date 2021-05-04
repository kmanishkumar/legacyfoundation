//import 'dart:convert';
//import 'dart:math';
//
//import 'package:flushbar/flushbar.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//import 'package:found_legacy/admin_app/app/components/users/usersFirst/create_user.dart';
//
//import 'package:found_legacy/services/api_services.dart';
//
//class ManageRoles extends StatefulWidget {
//  var responseData;
//
//  ManageRoles({
//    this.responseData,
//  });
//
//  @override
//  _ManageRolesState createState() => _ManageRolesState();
//}
//
//class _ManageRolesState extends State<ManageRoles> {
//  ApiService _apiService = ApiService();
//
//  bool isAdmin = false;
//
//  bool manageTemplate = false;
//  bool manageCategories = false;
//  bool useTemplates = false;
//  bool manageUsers = false;
//  bool manageJobs = false;
//  bool manageDocs = false;
//  bool manageNotes = false;
//
//  bool create = false;
//  bool read = false;
//  bool update = false;
//  bool delete = false;
//
//  bool createTemplate = false;
//  bool readTemplate = false;
//  bool updateTemplate = false;
//  bool deleteTemplate = false;
//
//  bool createCategory = false;
//  bool readCategory = false;
//  bool updateCategory = false;
//  bool deleteCategory = false;
//
//  bool createUseTemp = false;
//  bool readUseTemp = false;
//  bool updateUseTemp = false;
//  bool deleteUseTemp = false;
//
//  bool createUsers = false;
//  bool readUsers = false;
//  bool updateUsers = false;
//  bool deleteUsers = false;
//
//  bool createDocs = false;
//  bool readDocs = false;
//  bool updateDocs = false;
//  bool deleteDocs = false;
//
//  bool createJobs = false;
//  bool readJobs = false;
//  bool updateJobs = false;
//  bool deleteJobs = false;
//
//  bool createNotes, readNotes, updateNotes, deleteNotes = false;
//
//  var roleName = TextEditingController();
//  var roleDescription = TextEditingController();
//
//  static final List<String> _listViewData = [
//    "create",
//    "read",
//    "update",
//    "delete"
//  ];
//
//  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
//      6,
//      (i) => ExpansionTile(
//            title: Text(
//              "Expansion $i",
//              style: TextStyle(color: Colors.black),
//            ),
//            children: _listViewData
//                .map((data) => ListTile(
//                      leading: Icon(
//                        Icons.person,
//                        color: Colors.black,
//                      ),
//                      title: Text(
//                        data,
//                        style: TextStyle(color: Colors.black),
//                      ),
//                    ))
//                .toList(),
//          ));
//
//  @override
//  Widget build(BuildContext context) {
//    final _width = MediaQuery.of(context).size.width;
//
//    final _height = MediaQuery.of(context).size.height;
//
//    final blockSize = _width / 100;
//
//    final blockSizeVertical = _height / 100;
//
//    var res = widget.responseData;
//    print(res);
//
//    var rName = widget.responseData.toString().split("??")[0];
//    print(rName);
//
////    var rId = widget.responseData.toString().split("??")[1];
////    print(rId);
//
//    return Scaffold(
//        backgroundColor: Colors.white,
//        appBar: AppBar(
//          leading: Builder(
//            builder: (context) => IconButton(
//              icon: new Icon(
//                Icons.menu,
//                color: Colors.black,
//                size: 25,
//              ),
//              onPressed: () => Scaffold.of(context).openDrawer(),
//            ),
//          ),
//          centerTitle: true,
//          title: Text("Roles", style: Theme.of(context).textTheme.headline),
//          elevation: 0,
//          backgroundColor: Colors.white,
//        ),
////        drawer: new DrawerOnly(),
//        body: Container(
//          padding: EdgeInsets.all(10),
//          margin: EdgeInsets.all(10),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Expanded(
//                    child: TextFormField(
//                      controller: roleName,
//                      autovalidate: true,
//                      keyboardType: TextInputType.emailAddress,
//                      style: TextStyle(color: Colors.black),
////                        initialValue: widget.responseData.toString().split("??")[0],
//                      decoration: InputDecoration(
//                          hintText:
//                              widget.responseData == null ? "Role Name" : rName,
//                          hintStyle:
//                              TextStyle(color: Colors.grey, fontSize: 15.0),
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(5)),
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(5),
//                              borderSide: BorderSide(color: Colors.black),
//                              gapPadding: 1.5),
//                          contentPadding: EdgeInsets.all(10)),
//                    ),
//                  ),
//                  SizedBox(width: blockSize * 4),
//                  Expanded(
//                    child: TextFormField(
//                      controller: roleDescription,
//                      autovalidate: true,
//                      keyboardType: TextInputType.emailAddress,
//                      style: TextStyle(color: Colors.black),
//                      decoration: InputDecoration(
////                              labelText: "Role Name"",
////                              labelStyle: TextStyle(color: Colors.black),
//                          hintText: "Role Description",
//                          hintStyle:
//                              TextStyle(color: Colors.grey, fontSize: 15.0),
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(5)),
//                          enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(5),
//                              borderSide: BorderSide(color: Colors.black),
//                              gapPadding: 1.5),
//                          contentPadding: EdgeInsets.all(10)),
//                    ),
//                  ),
//                  SizedBox(width: blockSize * 4),
//                  GestureDetector(
//                    onTap: () => showAlert(
//                        widget.responseData.toString().split("??")[1]),
//                    child: SizedBox(
//                      width: 150,
//                      height: 50,
//                      child: Card(
//                        elevation: 10,
//                        color: Colors.white,
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text(
//                            'Delete Role',
//                            textAlign: TextAlign.center,
//                            style: TextStyle(color: Colors.red),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Divider(
//                height: 10.0,
//                color: Colors.black,
//              ),
//
//              Expanded(
//                  child: Container(
//                      padding: EdgeInsets.all(10),
////                      color: Colors.blue,
//                      child: ListView(
//                        children: <Widget>[
//                          Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Admin",
//                                        textAlign: TextAlign.start,
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to have access to all permissions below",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: isAdmin,
//                                    onChanged: (value) {
//                                      setState(() {
//                                        isAdmin = value;
//                                      });
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Templates",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to add, edit, delete, and replace templates",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageTemplate,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageTemplate = value;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Categories",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to create, edit, and delete categories",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageCategories,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageCategories = value;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Use Templates",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to use and send templates ",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: useTemplates,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          useTemplates = value;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Users",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to add, edit, and delete other users",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageUsers,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageUsers = value;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Jobs",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to create new Job IDs and Job descriptions",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageJobs,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageJobs = value;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Documents",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to add, modify, and delete Docs",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageDocs,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageDocs = value;
//                                        });
//                                      } else if (isAdmin = false) {
//                                        setState(() {
//                                          isAdmin = false;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Text("Manage Notes",
//                                        style: Theme.of(context)
//                                            .textTheme
//                                            .display1),
//                                  ),
//                                  Expanded(
//                                    child: Text(
//                                      "Allow a user to add, modify, and delete notes",
//                                      textAlign: TextAlign.start,
//                                      style: Theme.of(context).textTheme.body1,
//                                    ),
//                                  ),
//                                  Switch(
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.shrinkWrap,
//                                    value: manageNotes,
//                                    onChanged: (value) {
//                                      if (isAdmin == true) {
//                                        setState(() {
////                                          isAdmin = value;
//                                          manageNotes = value;
//                                        });
//                                      } else if (isAdmin = false) {
//                                        setState(() {
//                                          isAdmin = false;
//                                        });
//                                      }
//                                    },
//                                    activeTrackColor: Colors.lightGreenAccent,
//                                    activeColor: Colors.green,
//                                  )
//                                ],
//                              ),
//                              SizedBox(
//                                height: blockSizeVertical * 5,
//                              ),
//                            ],
//                          ),
//                        ],
//                      ))),
//
//              SizedBox(
//                height: blockSizeVertical * 4,
//              ),
//              GestureDetector(
//                onTap: () {
//                  _validateAndSubmit();
//                },
//                child: SizedBox(
//                  width: 140,
//                  height: 70,
//                  child: Card(
//                    elevation: 10,
//                    color: Colors.white,
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: Text(
//                        'Create Role',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: Color(0xff77a8ff),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//
////              Expanded(
////                  child: Container(
////                color: Colors.blue,
////                child: ListView(
////                  children: _listOfExpansions
////                      .map((expansionTile) => expansionTile)
////                      .toList(),
////                ),
////              )),
//            ],
//          ),
//        ));
//  }
//
//  void _validateAndSubmit() async {
//    bool toggleAdmin = isAdmin;
//    print(toggleAdmin);
//
//    if (isAdmin == true) {
//      setState(() {
//        create = true;
//        read = true;
//        update = true;
//        delete = true;
//      });
//    }
//
//    if (manageTemplate == true) {
//      setState(() {
//        createTemplate = true;
//        readTemplate = true;
//        updateTemplate = true;
//        deleteTemplate = true;
//      });
//    }
//
//    if (manageCategories == true) {
//      setState(() {
//        createCategory = true;
//        readCategory = true;
//        updateCategory = true;
//        deleteCategory = true;
//      });
//    }
//
//    if (useTemplates == true) {
//      setState(() {
//        createUseTemp = true;
//        readUseTemp = true;
//        updateUseTemp = true;
//        deleteUseTemp = true;
//      });
//    }
//
//    if (manageUsers == true) {
//      setState(() {
//        createUsers = true;
//        readUsers = true;
//        updateUsers = true;
//        deleteUsers = true;
//      });
//    }
//
//    if (manageJobs == true) {
//      setState(() {
//        createUsers = true;
//        readUsers = true;
//        updateUsers = true;
//        deleteUsers = true;
//      });
//    }
//
//    if (manageDocs == true) {
//      setState(() {
//        createDocs = true;
//        readDocs = true;
//        updateDocs = true;
//        deleteDocs = true;
//      });
//    }
//
//    if (manageNotes == true) {
//      setState(() {
//        createNotes = true;
//        readNotes = true;
//        updateNotes = true;
//        deleteNotes = true;
//      });
//    }
//
//    var roleN = roleName.text;
//    print(roleN);
//    var roleD = roleDescription.text;
//    print(roleD);
//
//    var roleData = {
//      "name": roleN,
//      "description": roleD,
//      "permissions": jsonEncode({
//        "admin": isAdmin,
//        "manageTemplates": {
//          "create": createTemplate,
//          "read": readTemplate,
//          "update": updateTemplate,
//          "delete": deleteTemplate
//        },
//        "manageCategories": {
//          "create": createCategory,
//          "read": readCategory,
//          "update": updateCategory,
//          "delete": deleteCategory
//        },
//        "manageUsers": {
//          "create": createUsers,
//          "read": readUsers,
//          "update": updateUsers,
//          "delete": deleteUsers
//        },
//        "manageJobs": {
//          "create": createJobs,
//          "read": readJobs,
//          "update": updateJobs,
//          "delete": deleteJobs
//        },
//        "manageDocuments": {
//          "create": createDocs,
//          "read": readDocs,
//          "update": updateDocs,
//          "delete": deleteDocs
//        },
//        "manageNotes": {
//          "create": createNotes,
//          "read": readNotes,
//          "update": updateNotes,
//          "delete": deleteNotes
//        }
//      })
//    };
//
//    // var encodeRoleData = json.encode(roleData);
//    // print(encodeRoleData);
//
//    var response = await _apiService.createRole(roleData);
//    print(response);
//
//    Flushbar(
//      message: response.message,
//      icon: Icon(Icons.info_outline),
//      duration: Duration(seconds: 5),
//      flushbarPosition: FlushbarPosition.BOTTOM,
//      backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
//      animationDuration: Duration(seconds: 2),
//      flushbarStyle: FlushbarStyle.FLOATING,
//      isDismissible: true,
//      borderRadius: 90.0,
//      margin: EdgeInsets.all(10),
//      boxShadows: [
//        BoxShadow(
//            color: Colors.black,
//            blurRadius: 3,
//            spreadRadius: 2,
//            offset: Offset(0.2, 1.8)),
//      ],
//      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
//    )..show(context);
//
//    Navigator.push(context, MaterialPageRoute(builder: (_) => CreateUser()));
//  }
//
//  showAlert(value) {
//    print(value);
//    showDialog(
//        barrierDismissible: true,
//        context: context,
//        builder: (BuildContext context) {
//          return new CupertinoAlertDialog(
//            title: new Text("Delete Role"),
//            content: new Text("Do you really want to delete?"),
//            actions: [
//              CupertinoDialogAction(
//                isDefaultAction: true,
//                child: new Text("Cancel"),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//              CupertinoDialogAction(
//                isDefaultAction: true,
//                child: new Text(
//                  "Delete",
//                  style: TextStyle(color: Colors.red),
//                ),
//                onPressed: () {
//                  deleteRole(args: value);
//                  Navigator.of(context).pop();
//                },
//                isDestructiveAction: true,
//              )
//            ],
//          );
//        });
//  }
//
//  void deleteRole({args}) async {
//    var data = args;
//    print(data);
//
//    var response = await _apiService.deleteRole(data);
//
//    print(response.message);
//
//    if (response.resMsg == 'success') {
//      Flushbar(
//        message: response.message,
//        icon: Icon(Icons.info_outline),
//        duration: Duration(seconds: 5),
//        flushbarPosition: FlushbarPosition.BOTTOM,
//        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
//        animationDuration: Duration(seconds: 2),
//        flushbarStyle: FlushbarStyle.FLOATING,
//        isDismissible: true,
//        borderRadius: 90.0,
//        margin: EdgeInsets.all(10),
//        boxShadows: [
//          BoxShadow(
//              color: Colors.black,
//              blurRadius: 3,
//              spreadRadius: 2,
//              offset: Offset(0.2, 1.8)),
//        ],
//        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
//      )..show(context);
//    } else if (response.resMsg == "failure") {
//      debugPrint("before flushbar");
//      Flushbar(
//        message: "error while deleting role",
//        icon: Icon(Icons.info_outline),
//        duration: Duration(seconds: 5),
//        flushbarPosition: FlushbarPosition.BOTTOM,
//        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
//        animationDuration: Duration(seconds: 2),
//        flushbarStyle: FlushbarStyle.FLOATING,
//        borderRadius: 90.0,
//        margin: EdgeInsets.all(10),
//        isDismissible: true,
//        boxShadows: [
//          BoxShadow(
//              color: Colors.black,
//              blurRadius: 3,
//              spreadRadius: 2,
//              offset: Offset(0.2, 1.8)),
//        ],
//        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
//      )..show(context);
//    } else {
//      ErrorDescription("Someting went wrong");
//    }
//  }
//}
//
//class RoleModel {
//  final String roleName;
//  final String roleDescription;
//
//  RoleModel({this.roleDescription, this.roleName});
//}
//
//List<RoleModel> dummyData = [
//  new RoleModel(
//    roleName: "Admin",
//    roleDescription: "Allow a user to have access to all permissions below",
//  ),
//  new RoleModel(
//    roleName: "Manage Templates",
//    roleDescription: "Allow a user to add, edit, delete, and replace templates",
//  ),
//  new RoleModel(
//    roleName: "Manage Categories",
//    roleDescription: "Allow a user to create, edit, and delete categories",
//  ),
//  new RoleModel(
//    roleName: "Use Templates",
//    roleDescription: "Allow a user to use and send templates ",
//  ),
//  new RoleModel(
//    roleName: "Manage Users",
//    roleDescription: "Allow a user to add, edit, and delete other users",
//  ),
//  new RoleModel(
//    roleName: "Manage Jobs",
//    roleDescription: "Allow a user to create new Job IDs and Job descriptions",
//  ),
//  new RoleModel(
//    roleName: "Manage Notes",
//    roleDescription: "Allow a user to add, modify, and delete notes",
//  )
//];
//
////    var roleData = {
////      "name": roleN,
////      "description": roleD,
////      "permissions": json.encode({"admin": isAdmin}),
////      "manageTemplates": json.encode(
////          {"create": true, "read": true, "update": true, "delete": true}),
////      "manageCategories": json.encode(
////          {"create": true, "read": true, "update": true, "delete": true}),
////      "manageUsers": json.encode(
////          {"create": false, "read": true, "update": false, "delete": false}),
////      "manageJobs": json.encode(
////          {"create": true, "read": true, "update": true, "delete": true}),
////      "manageDocuments": json.encode(
////          {"create": true, "read": true, "update": true, "delete": true}),
////      "manageNotes": json.encode(
////          {"create": true, "read": true, "update": true, "delete": true})
////    };
