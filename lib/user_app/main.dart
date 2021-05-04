import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';

import 'package:found_legacy/user_app/app/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(UserApp());

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()),

      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              textSelectionHandleColor: Colors.black, //onPress pointer color
              canvasColor: Colors.black, // onPress box color
              textSelectionColor: Colors.lightBlueAccent, // onPress text color
              indicatorColor: Colors.purple,
              primaryColor: Colors.black,
              accentColor: Colors.black,
              textTheme: _textTheme(),
              accentTextTheme: _textTheme(),
              primaryTextTheme: _textTheme(),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                minWidth: 25.0,
                height: 35.0,
                padding: EdgeInsets.all(8.0),
                buttonColor: Colors.green,
                disabledColor: Colors.grey,
                focusColor: Colors.redAccent,
                hoverColor: Colors.pinkAccent,
                highlightColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                ),
              )),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}

TextTheme _textTheme() {
//  return TextTheme(
//    headline: TextStyle(fontSize: 20.0, color: Colors.black),
//    title: TextStyle(
//      color: Colors.black,
//      fontSize: 14.0,
//      fontStyle: FontStyle.italic,
//    ),
//    body1: TextStyle(fontSize: 14.0, color: Colors.black),
//    body2: TextStyle(fontSize: 22.0),
//    display1: TextStyle(
//        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
//    display2: TextStyle(fontSize: 23.0, color: Colors.black),
//    display3: TextStyle(fontSize: 18.0, color: Colors.black),
//    display4: TextStyle(
//        fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
//  );

  return TextTheme(
    headline: TextStyle(fontSize: 20.0, color: Colors.black),
    title: TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontStyle: FontStyle.italic,
    ),
    body1: TextStyle(fontSize: 14.0, color: Colors.black),
    body2: TextStyle(fontSize: 22.0),
    display1: TextStyle(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    display2: TextStyle(fontSize: 23.0, color: Colors.black),
    display3: TextStyle(fontSize: 18.0, color: Colors.black),
    display4: TextStyle(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
