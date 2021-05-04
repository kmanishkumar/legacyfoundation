import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/category/manage_cat.view.dart';

import 'package:found_legacy/admin_app/app/components/webDocuments_admin/getDocs_admin.dart';

import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/login.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ApiService _apiService = ApiService();

  SharedPreferences sharedPreferences;

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

    var provider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: true,
        title: Text("Legacy Foundation", style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          GestureDetector(
            onTap: () => showAlert(provider),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 100,
                padding: EdgeInsets.all(5),
                height: 40,
                margin: EdgeInsets.only(right: 10, top:7, left: 5),
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => WebDocuments()));
                },
              child: SizedBox(
                width: _width/3.5,
                height: 200,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Manage Documents',
                      textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UsersListScreen()));
              },
              child: SizedBox(
                width: _width/3.5,
                height: 200,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                    child:Align(
                      alignment: Alignment.center,
                      child:Text(
                        'Manage Users',
                        textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AdminManageCat()));
              },
              child: SizedBox(
                width: _width/3.5,
                height: 200,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Manage Categories',
                      textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  showAlert(provider) {
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

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => InitiateLogin()));

  }
}
