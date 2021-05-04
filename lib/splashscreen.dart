import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/admin_app/main.dart';
import 'package:found_legacy/login.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/user_app/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  SharedPreferences sharedPreferences;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )
      ..addStatusListener((status) =>
      status == AnimationStatus.completed
          ? getCredential()
          : animationController.forward());
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final _logo = Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      alignment: Alignment.center,
      child: ScaleTransition(
        scale: animation,
        child: Image.asset(
          'images/logo.png',
          height: 80,
          fit: BoxFit.contain,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "images/img2.jpg"),
                      fit: BoxFit.fill)
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      "images/logo3.jpg",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomLeft,
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  void getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();

    var provider = Provider.of<LoginProvider>(context,listen: false);
    print(provider);

    if (provider.userDetails != null) {
      var email = provider.userDetails.info.email;
      print(email);

      var password = provider.userDetails.password;
      print(password);

      final token = provider.token;
      print(token);

      final roleName = await AdminUtil.sharePrefsRoleName();
      print(roleName);

      if (token == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => InitiateLogin()));
      } else if (token.isNotEmpty) {
        if (roleName == "Admin") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AdminApp()));
        } else if (roleName == "User") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => UserApp()));
        }
      }
    } else if (provider.userDetails == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => InitiateLogin()));
    }
  }
}
