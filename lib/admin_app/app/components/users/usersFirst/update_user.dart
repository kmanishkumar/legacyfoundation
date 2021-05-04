import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/update_user.methods.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/admin_app/app/providers/DataProviderAdmin.dart';
import 'package:found_legacy/models/user_audit.model.dart';
import 'package:found_legacy/models/user_documents.model.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/services/dioApiCalls.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_log_note2.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/webView_read.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class UpdateUser extends StatefulWidget {
  var responseData;

  UpdateUser({this.responseData});

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      GlobalKey<AsyncLoaderState>();
  ApiService _apiService = ApiService();
  var roleId;

  var _firstName = TextEditingController();
  var _lastName = TextEditingController();
  var _email = TextEditingController();
  var _role = TextEditingController();
  var _phone = TextEditingController();
  var   _userId = TextEditingController();
  var _sId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    roleId= widget.responseData.role;
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
        title: Text("Legacy Foundation",
            style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: AsyncLoader(
        initState: () => DioService().getAllRoles(),
        renderLoad: () => Center(
          child: RefreshProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.black),
          ),
        ),
        renderError: ([err]) => Center(
          child: Text('There was a error getting the data '),
        ),
        renderSuccess: ({data}) => _generateBody(data),
      ),
    );
  }

  _generateBody(data) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final blockSize = _width / 100;
    final blockSizeVertical = _height / 100;
    final _statusGap = MediaQuery.of(context).padding.top + 10;

    final _dataProvider = Provider.of<DataAdminProvider>(context,listen: false);
    var userData = widget.responseData;
    _firstName.text = userData.firstName;
    _lastName.text = userData.lastName;
    _email.text = userData.info.email;
    _phone.text = userData.info.phone;
    _userId.text = userData.userId;
    _sId.text = userData.sId;


    List<dynamic> dl = data.data;
    List<String> sl = dl.cast<String>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
            child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width *0.4,
              margin: EdgeInsets.only(left: 20),
              height: 70,
              child: TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 25),
                initialValue: _firstName.text,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
              ),
            ),

            InkWell(
              onTap: ()=>{
                showAlert(_sId.text)
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  'Delete User',
                  style: TextStyle(color: Colors.red, fontSize: 22),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _validateAndSubmit(_dataProvider);
              },
              child: Container(
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white,fontSize: 22),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 300,
            margin: EdgeInsets.only(left: 20),
            height: 70,
            child: TextFormField(
              style: TextStyle(color: Colors.black, fontSize: 25),
              initialValue: _email.text,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                Icons.edit,
                color: Colors.black,
              )),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Role',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              foregroundDecoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.black)),
              child: SizedBox(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                      style: TextStyle(color: Colors.black,fontSize: 20),
                      underline: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      onChanged: (String newValue) {

                        setState(() {
                          roleId = newValue ;
                          widget.responseData.role=roleId;
                        });
                      },

                      value: roleId,

                      items: sl.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.split('??')[1],
                          child: Text(value.split('??')[0],style: TextStyle(fontSize: 20),),
                        );
                      }).toList(),

                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            width: _width,
            height: _height,
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: 'View Documents',
                      ),
                      Tab(
                        text: 'View Audit Logs',
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    _generateViewDocuments(),
                    _generateViewAudits(),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _generateViewDocuments() {
    return AsyncLoader(
      initState: () async =>
          await UpdateUserMethods.getUserDocuments(_sId.text),
      renderLoad: () => Center(
        child: RefreshProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
      renderError: ([err]) => Center(
        child: Text('No documents present '),
      ),
      renderSuccess: ({data}) => buildDocumentsBody(data),
    );
  }

  _generateViewAudits() {
    return AsyncLoader(
      initState: () async =>
          await UpdateUserMethods.getUserAuditLogs(_sId.text),
      renderLoad: () => Center(
        child: RefreshProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
      renderError: ([err]) => Center(
        child: Text('No Audit Logs present'),
      ),
      renderSuccess: ({data}) => buildAuditBody(data),
    );
  }

  buildAuditBody(UserAuditLogs data) {
    return ListView.builder(
      itemCount: data.logs.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print(data.logs
                .elementAt(index)
                .type);
            if (data.logs
                .elementAt(index)
                .type == 'note') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) =>
                  AuditNote(
                    responseData: data.logs.elementAt(index),
                  )));
            }
            if (data.logs
                .elementAt(index)
                .type == 'document') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) =>
                  UserWebViewUpdate(
                    responseData: data.logs
                        .elementAt(index)
                        .documentId,
                  )));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              data.logs.elementAt(index).name == null
                                  ? ''
                                  : data.logs.elementAt(index).name,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            child: Text(
                              data.logs.elementAt(index).category == null
                                  ? ''
                                  : '- ' + data.logs.elementAt(index).category,
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          _formatDateAuditLogs(
                              data.logs.elementAt(index).createdAt),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.blueGrey,
                height: 0.2,
              )
            ],
          ),
        );
      },
    );
  }

  buildDocumentsBody(UserDocuments data) {
    return ListView.builder(
      itemCount: data.documents.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UserWebViewUpdate(
                responseData: data.documents.elementAt(index).documentId,
              )));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        data.documents.elementAt(index).name,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 200),
                      child: Text(
                        data.documents.elementAt(index).status,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        _formatDate(data.documents.elementAt(index).modifiedAt),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.blueGrey,
                height: 0.2,
              )
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime modifiedAt) {
    return DateFormat.yMd().format(modifiedAt).toString() +
        '\n' +
        DateFormat.jm().format(modifiedAt).toString();
  }

  String _formatDateAuditLogs(String modifiedAt) {
    DateTime dateTime = DateTime.parse(modifiedAt);
    return DateFormat.yMd().format(dateTime).toString() +
        '  @ ' +
        DateFormat.jm().format(dateTime).toString();
  }

  void _validateAndSubmit(DataAdminProvider dataProvider) async {
    var userData = {
      "firstName": _firstName.text,
      "lastName": _lastName.text,
      "email": _email.text,
      "role": roleId,
      "phone": _phone.text,
      "UserId": _userId.text,
    };

    var response = await _apiService.updateUser(userData, _sId.text);

    if (response.resMsg == 'success') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => UsersListScreen()));
    }


  }

  showAlert(value) {
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
                  deleteUser(value);
                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  void deleteUser(String value) async {
    var data = value;
    print(data);


    var deleteUser = value;
    print("deleteUser==>$deleteUser");

    var response = await _apiService.deleteUser(deleteUser);

    print(response.message);

    if (response.resMsg == 'success') {

      Navigator.pop(context);
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
}
