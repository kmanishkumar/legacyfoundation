import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/dashboard/dashboard.dart';

import 'package:found_legacy/admin_app/app/components/users/usersFirst/create_user.dart';

import 'package:found_legacy/admin_app/app/components/users/usersFirst/update_user.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';
import 'package:intl/intl.dart';

class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState = new GlobalKey<AsyncLoaderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
//            onPressed: () => Navigator.of(context).pop()
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Dashboard())),
        ),
        centerTitle: true,
        title: Text("Legacy Foundation",
            style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => CreateUser()));
            },
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
                      'Create User',
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
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Name',
//                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Email',
//                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Role',
//                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Date Created',
//                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Delete User',
//                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                ]),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            Expanded(
              child: AsyncLoader(
                key: _asyncLoaderState,
                initState: () async => _apiService.getUserList(),
                renderLoad: () => Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
                renderError: ([err]) => Text('Has Error'),
                renderSuccess: ({data}) => userListView(data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userListView(data) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    var values = data;
    print(values);

    if (data == null) {
      return Container();
    } else if (data.user == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.user;

      return Container(
//        color: Colors.green,
        child: RefreshIndicator(
          backgroundColor: Colors.white,
          color: Colors.blue,
          onRefresh: () => _asyncLoaderState.currentState.reloadState(),
          child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, int index) => Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => UpdateUser(
                                        responseData: values[index],
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${values[index].firstName}\n${values[index].lastName}',
                                      style:
                                          Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      values[index].info.email,
                                      style:
                                          Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Text(
                                        values[index]
                                                    .info
                                                    .role
                                                    .permissions
                                                    .admin ==
                                                true
                                            ? "Admin"
                                            : "User",
                                        style:
                                            Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _getDate(values[index].createdAt),
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(Icons.delete,
                                        color: Colors.black, size: 20),
                                    onPressed: () => showAlert(values[index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
//                      SizedBox(
//                        height: blockSizeVertical * .035,
//                      ),
                    ],
                  )),
        ),
      );
    }
  }

  String _getDate(data) {
    var date = DateTime.parse(data.toString()).toLocal();
    return DateFormat("MM/dd/yyyy").format(date).toString();
  }

  void deleteUser({args}) async {
    var data = args;
    print(data);

    String sId = NoteProvider().setNoteId = data.sId;
    print("NoteId==>$sId");

    var deleteUser = sId;
    print("deleteUser==>$deleteUser");

    var response = await _apiService.deleteUser(deleteUser);

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
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "error while deleting note",
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

  showAlert(value) {
    print(value);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Delete User"),
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
                  deleteUser(args: value);
                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }
}

//
//Expanded(
//child: Text(
//'${values[index].firstName}\n${values[index].lastName}',
//style: Theme.of(context).textTheme.display4,
//textAlign: TextAlign.start,
//),
//),
//Expanded(
//child: Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text(
//values[index].info.email,
//style: Theme.of(context).textTheme.display4,
//textAlign: TextAlign.start,
//),
//),
//),
//Expanded(
//child: Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text(
//values[index].info.role.permissions.admin == true
//? "Admin"
//    : "User",
//style: Theme.of(context).textTheme.display4,
//textAlign: TextAlign.center,
//),
//),
//),
//Expanded(
//child: Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text(
////                          '10/21/2017',
//_getDate(values[index].createdAt),
//style: Theme.of(context).textTheme.display4,
//),
//),
//),
////                      Expanded(
////                        child: Padding(
////                          padding: const EdgeInsets.all(8.0),
////                          child: Text(
//////                          '06/12/2019',
////                            _getDate(values[index].modifiedAt),
////                            style: Theme.of(context).textTheme.display4,
////                          ),
////                        ),
////                      ),
//IconButton(
//icon: Icon(
//Icons.delete,
//color: Colors.black,
//size: 22,
//),
//onPressed: () {
//deleteNote(args: values[index]);
//},
////                          onPressed: showAlert,
//),
