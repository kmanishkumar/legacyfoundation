import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:provider/provider.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context,listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Center(
            child: Container(
              width: 120,
              height: 50,
              child: CupertinoButton(
                color: Colors.black,
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => showAlert(provider),
              ),
            ),
          ),
        ));
  }

  showAlert(provider) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Logout"),
            content: new Text("Do you really want to Logout?"),
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
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  LogoutUser(provider);
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  void LogoutUser(LoginProvider loginProvider) async {
    var password = loginProvider.userDetails.password;
    print(password);

    var email = loginProvider.userDetails.info.email;
    print(email);

    var logoutData = {"email": email, "password": password};

    print(logoutData);

    var response = await _apiService.logout(logoutData);

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
//          context, MaterialPageRoute(builder: (_) => UsersListScreen()));
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "error while deleting note",
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
      ErrorDescription("Someting went wrong");
    }
  }
}
