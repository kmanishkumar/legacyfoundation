import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/create_doc_admin/create_doc_admin.view.dart';
import 'package:found_legacy/admin_app/app/components/dashboard/dashboard.dart';
import 'package:found_legacy/admin_app/app/components/documents/create_document.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/create_web_doc.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/test_webView_admin.dart';

import 'package:found_legacy/admin_app/app/components/webDocuments_admin/webView_admin.dart';

import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDocuments extends StatefulWidget {
  @override
  _WebDocumentsState createState() => _WebDocumentsState();
}

class _WebDocumentsState extends State<WebDocuments> {
  ApiService _apiService = ApiService();


  TextEditingController _email = TextEditingController(text: 'user@zibtek.in');
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];

  var roleId;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

//    1blockSize=3.6;
//    1blockSizeVertical=6.4;

    var provider = Provider.of<LoginProvider>(context,listen: false);

//    var provider = Provider.of<LoginProvider>(context);

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
          title: Text("Documents", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              onTap: () => {
//                Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateDocAdmin()))
                Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateDocAdmin()))
              },
//              onTap: () => _showEditDelete(context),

              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 180,
                  height: 60,
                  margin: EdgeInsets.only(right: 30, left: 10),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create Document',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            )
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
                            style: Theme.of(context).textTheme.body1),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Category',
//                              textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.body1),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Status',
//                            textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Created At',
//                            textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: blockSize * 20,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Delete Doc',
//                            textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                    ))
                  ]),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              Expanded(
                child: AsyncLoader(
                  key: _asyncLoaderState,
//                  initState: () async => await _apiService.getDocuments(),
                  initState: () async =>
                      await _apiService.getDocuments(),
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
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    if (data == null) {
      return Container();
    } else if (data.documents == null) {
      return Container(
        child: Center(
          child: Text(
              "No documents found",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.documents;
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      WebViewLoader(
                                        responseData: values[index],
                                      )));
                        },

//                        onTap: () {
//                          Navigator.pushReplacement(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (BuildContext context) =>
//                                      WebViewLoaderState(
//                                        responseData: values[index],
//                                      )));
//                        },

                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
//                                        values[index]
//                                            .fileInfo[0]
//                                            .fileInfo
//                                            .filename,
                                        values[index].name,
//                                        values[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display3,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        values[index].category,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display3,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        values[index].status,
//                                        values[index].status,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display3,
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
//                                        _getDate(values[index].modifiedAt),
                                        style: Theme.of(context)
                                            .textTheme
                                            .display3,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.delete,
                                          color: Colors.black, size: 20),
//                                      onPressed: () {
//                                        deleteNote(args: values[index]);
//                                      },
//                                      onPressed: () => _showEditDelete(context),
                                      onPressed: () =>
                                          showAlertDelete(values[index]),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
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

  void deleteDocument({args}) async {
    var data = args;
    print(data);
    String userId = data.sId;
    print("DocId==>$userId");
    var deleteDoc = userId;
    print("deleteDocrData==>$deleteDoc");
    var response = await _apiService.deleteDoc(deleteDoc);

    print(response.message);

    if (response.resMsg == 'success') {
      _asyncLoaderState.currentState.reloadState();
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
      Flushbar(
        message: "error while deleting user",
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
              color: Colors.green,
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
                          builder: (_) =>
                              WebViewLoaderCreate()));
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  void _showEditDelete(context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: Text('Document'),
          content: Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: blockSizeVertical * 5,
                    child: Row(
                      children: <Widget>[
//                        Icon(Icons.pageview),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              icon: Icon(Icons.pageview,
                                  color: Colors.black, size: 25)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('View Document'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: blockSizeVertical * 5,
                    child: Row(
                      children: <Widget>[
//                        Icon(Icons.edit),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              icon: Icon(Icons.edit,
                                  color: Colors.black, size: 25)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Edit Document'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: blockSizeVertical * 5,
                    child: Row(
                      children: <Widget>[
//                        Icon(Icons.delete),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              icon: Icon(Icons.delete,
                                  color: Colors.black, size: 25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('Delete Document'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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

  showAlertDelete(value) {
    print(value);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Delete Documnet"),
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
                  deleteDocument(args: value);
                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }
}
