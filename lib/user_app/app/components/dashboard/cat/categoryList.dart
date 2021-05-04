import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/login.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/dashboard/cat/GetAllCat.methods.dart';
import 'package:found_legacy/user_app/app/components/documentList.dart';
import 'package:found_legacy/user_app/app/components/webDocs/docs_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var blockSize = width / 100;
    var blockSizeVertical = height / 100;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Category", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
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
        body: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // Opacity(
              //     opacity: 0.8,
              //     child: Image.asset(
              //       "images/img1.jpg",
              //       fit: BoxFit.fill,
              //     )),
              AsyncLoader(
                initState: () => GetAllCatMethods.getAllCat(),
                renderLoad: () => Center(
                    child: RefreshProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                )),
                renderError: ([err]) => Text('There was a error'),
                renderSuccess: ({data}) =>
                    GetAllCatMethods.generateCatList(data),
              )
            ],
          ),
        )));
  }

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

//  void LogoutUser(provider) {}

  void LogoutUser(LoginProvider loginProvider) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => InitiateLogin()));
  }
}
