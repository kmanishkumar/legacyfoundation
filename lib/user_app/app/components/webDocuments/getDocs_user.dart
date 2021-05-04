import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_legacy/login.dart';

import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/splashscreen.dart';

import 'package:found_legacy/user_app/app/components/webDocuments/create_web_doc_user.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/webView_user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserWebDocs extends StatefulWidget {
  @override
  _UserWebDocsState createState() => _UserWebDocsState();
}

class _UserWebDocsState extends State<UserWebDocs> {
  ApiService _apiService = ApiService();

  TextEditingController _email = TextEditingController();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    var provider = Provider.of<LoginProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Documents", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
//            GestureDetector(
//              onTap: () => showAlert(),
//              child: Align(
//                alignment: Alignment.centerRight,
//                child: Container(
//                  width: 150,
//                  height: 50,
//                  margin: EdgeInsets.only(right: 0, left: 10),
//                  child: Card(
//                    elevation: 0,
//                    color: Colors.white,
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: Text(
//                        'Create Document',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(color: Colors.blue),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
            GestureDetector(
              onTap: () => showAlertLogout(provider),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(5),
                  height: 40,
                  margin: EdgeInsets.only(right: 10, left: 5),
                  child: Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
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
                      width: blockSize * 25,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Name',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.display1),
                      ),
                    )),

                    Expanded(
                        child: Container(
                      width: blockSize * 25,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Category',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.display1),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 25,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Status',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 25,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Last Change',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    )),
//                    Expanded(
//                        child: Container(
//                            width: blockSize * 20,
//                            child: Align(
//                              alignment: Alignment.center,
//                              child: Text(
//                                'Delete Doc',
////                            textAlign: TextAlign.end,
//                                style: Theme.of(context).textTheme.body1,
//                              ),
//                            )))
                  ]),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              Expanded(
                child: AsyncLoader(
                  key: _asyncLoaderState,
                  initState: () async => await _apiService.getDocuments(),
                  renderLoad: () => Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  renderError: ([err]) => Text('Has Error'),
                  renderSuccess: ({data}) => webDocumentsView(data, provider),
                ),
              ),
            ],
          ),
        ));
  }

  Widget webDocumentsView(data, provider) {
    print(data);

    if (data == null) {
      return Container();
    } else if (data.documents == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.documents;
      print(values);

      debugPrint("values inside$values");

      return Container(
        child: RefreshIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          onRefresh: () => _asyncLoaderState.currentState.reloadState(),
          child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UserWebView(
                                          responseData: values[index],
                                        )));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      values[index].name,
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      'N/A',
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      values[index].status,
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _getDate(values[index].modifiedAt),
                                      style:
                                          Theme.of(context).textTheme.display3,
                                    ),
                                  ),
                                ),
                              ),
//                            IconButton(
//                              icon: Icon(Icons.delete,
//                                  color: Colors.black, size: 20),
//                              onPressed: () {
//                                deleteNote(args: values[index]);
//                              },
////                          onPressed: showAlert,
//                            ),
                            ]),
                          )),
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

  String _getTime(day) {
    var date = DateTime.parse(day.toString())
        .toLocal(); //toLocal=> if we need local time
    return DateFormat("h:mm a").format(date).toString();
  }

  void deleteNote({args}) async {
    var data = args;
    print(data);
    String userId = data.sId;
    print("NoteId==>$userId");
    var deleteDoc = userId;
    print("deleteUserData==>$deleteDoc");
    var response = await _apiService.deleteDoc(deleteDoc);

    print(response.message);

    if (response.resMsg == 'success') {
      Flushbar(
        message: response.message,
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        leftBarIndicatorColor: Colors.red,
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
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

//      Navigator.push(
//          context, MaterialPageRoute(builder: (_) => WebDocuments()));

      _asyncLoaderState.currentState.reloadState();
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "error while deleting user",
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        leftBarIndicatorColor: Colors.red,
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
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
    } else {
      ErrorDescription("Someting is wrong");
    }
  }

  showAlert() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Send Documnet To:'),
            content: Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: _validateEmail,
                    controller: _email,
                    decoration: InputDecoration(
                        labelText: "Email Id",
                        filled: true,
                        fillColor: Colors.grey.shade50),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
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
                  "Create Doc",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UserCreateDoc(data: _email.text)));
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
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

//  showAlertLogout(LoginProvider provider) {}

  showAlertLogout(provider) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            scrollController: ScrollController(keepScrollOffset: true),
            title: Text("Logout"),
            content: Text("Do you really want to Logout?"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  LogoutUser(provider);

                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  void LogoutUser(LoginProvider loginProvider) async {
//    var password = loginProvider.userDetails.password;
//    print(password);
//
//    var email = loginProvider.userDetails.info.email;
//    print(email);
//
//    var logoutData = {"email": email, "password": password};
//
//    print(logoutData);

//    var response = await _apiService.logout(logoutData);
//
//    print(response.message);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();

//    SystemNavigator.pop();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => InitiateLogin()));
  }
}
