import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_legacy/admin_app/app/components/category/manage_cat.bloc.dart';
import 'package:found_legacy/admin_app/app/providers/DataProviderAdmin.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/splashscreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:device_preview/device_preview.dart';
import 'globals.dart';
import 'package:provider/provider.dart';

// void main() => runApp(DevicePreview(
//       builder: (context) => Battlz(),
//     ));
Future main() async {
  DotEnv().env['APIURL'] = APIURL;
  DotEnv().env['DOCAPIURL'] =  DOCAPIURL;
  DotEnv().env['DOCSIGN'] =  DOCSIGN;
//  DotEnv().env['APIURL'] =  'http://192.168.0.35:3000/v0/';
//  DotEnv().env['DOCAPIURL'] =  'http:///192.168.0.35:3001/v0/';
//  DotEnv().env['DOCSIGN'] =  'http:///192.168.0.35:4200';
//   runApp(LegacyFoundation());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => LegacyFoundation(), // Wrap your app
    ),
  );

}

//void main() => runApp(DevicePreview(
//      builder: (context) => LegacyFoundation(),
//    ));

class LegacyFoundation extends StatelessWidget {
  @override
  Widget build(context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DataAdminProvider()),
        ChangeNotifierProvider(create: (_) => ManageCatBloc()),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Legacy Builders",
          theme: ThemeData(
              brightness: Brightness.light,
              textSelectionHandleColor: Colors.black, //onPress pointer color
              canvasColor: Colors.black, // onPress box color
              primarySwatch: Colors.red, //color of the text on canvas box
//          canvasColor: Colors.white,

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
          home: SplashScreen()

//        InitiateLogin(),
          ),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      headline: TextStyle(fontSize: 30.0, color: Colors.black),
      title: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      ),
      body1: TextStyle(fontSize: 18.0, color: Colors.black),
      body2: TextStyle(fontSize: 22.0),
      display1: TextStyle(fontSize: 22.0),
      display2: TextStyle(fontSize: 23.0, color: Colors.black),
      display3: TextStyle(fontSize: 14.0, color: Colors.black),
      display4: TextStyle(fontSize: 22.0, color: Colors.black),
    );
  }
}
