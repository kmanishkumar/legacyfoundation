import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/roles/manage_roles.dart';
import 'package:found_legacy/admin_app/app/components/roles/role_switch_edit.dart';
import 'package:found_legacy/admin_app/app/components/roles/roles_switch.dart';

import 'package:found_legacy/admin_app/app/components/users/usersFirst/create_user.dart';

import 'package:found_legacy/admin_app/app/components/users/usersFirst/update_user.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/services/dioApiCalls.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';
import 'package:intl/intl.dart';

class RolesListScreen extends StatefulWidget {
  @override
  _RolesListScreenState createState() => _RolesListScreenState();
}

class _RolesListScreenState extends State<RolesListScreen> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

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
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateUser())),
        ),
        centerTitle: true,
        title: Text("Legacy Foundation",
            style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => RolesSwitch())),
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
                      'Create New Role',
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
//                    color: Colors.blue,
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Role Name',
//                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.body1),
                    ),
                  )),
                  Expanded(
                      child: Container(
//                    color: Colors.red,
                    width: blockSize * 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Role ID',
//                          textAlign: TextAlign.center,
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
              renderSuccess: ({data}) => roleListView(data),
            )),
//    return SafeArea(child: _asyncLoader);
          ],
        ),
      ),
    );
  }

  Widget roleListView(data) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    var values = data.data;
    print(values);

    if (data == null) {
      return Container();
    } else if (data.data == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.data;

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
                                  builder: (BuildContext context) =>
                                      RolesSwitchEdit(
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
                                      values[index].toString().split('??')[0],
                                      style:
                                          Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
//                              Expanded(
//                                child: Container(
////                                  color:Colors.blue,
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Container(
//                                        color: Colors.green,
//                                      width: blockSize*50,
//                                        margin: EdgeInsets.only(
//                                            left: 20,
//                                            right: 10,
//                                            bottom: 0,
//                                            top: 0),
//                                        child: Text(
//                                          values[index]
//                                              .toString()
//                                              .split('??')[0],
//                                          style: Theme.of(context)
//                                              .textTheme
//                                              .display3,
//                                          textAlign: TextAlign.start,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),

                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      values[index].toString().split('??')[1],
                                      style:
                                          Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockSizeVertical * 4,
                      ),
                    ],
                  )),
        ),
      );
    }
  }
}
