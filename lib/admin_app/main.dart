import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_legacy/admin_app/app/providers/DataProviderAdmin.dart';
import 'package:found_legacy/admin_app/app/routes.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AdminApp());

//void main()=>DevicePreview(builder: (context)=> AdminApp());

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => DataAdminProvider())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
// Define the default brightness and colors.
                brightness: Brightness.dark,
                highlightColor: Colors.pink,
//              primaryColor: Colors.red,
//              accentColor: Colors.white,
                accentColor: Colors.black,
                accentTextTheme: _textTheme(),
                primaryTextTheme: _textTheme(),

// Define the default font family.

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
                textTheme: _textTheme(),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                  minWidth: 25.0,
                  height: 25.0,
                  padding: EdgeInsets.all(8.0),
                  buttonColor: Colors.black,
                  disabledColor: Colors.grey,
                  focusColor: Colors.redAccent,
                  hoverColor: Colors.pinkAccent,
                  highlightColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                )),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute));
  }
}

TextTheme _textTheme() {
  return TextTheme(
    headline: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
    title: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontFamily: 'AlegreyaSansSC'),
    body1: TextStyle(
        fontSize: 18.0, color: Colors.black),
    body2: TextStyle(fontSize: 22.0, color: Colors.black),
    display1: TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
    display2: TextStyle(fontSize: 23.0, color: Colors.red),
    display3: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),
    display4: TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
