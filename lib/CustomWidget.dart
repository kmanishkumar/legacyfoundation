import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class CustomWidgets {
  static showWarningFlushBar(BuildContext context, String content) {
    Flushbar(
      duration: Duration(milliseconds: 1000),
      borderRadius: 10,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      flushbarPosition: FlushbarPosition.TOP,
      onStatusChanged: ((callBack) {}),
      backgroundColor: Colors.red[800],
      flushbarStyle: FlushbarStyle.FLOATING,
      boxShadows: [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(4, 9),
          blurRadius: 7,
        ),
      ],
      forwardAnimationCurve: Curves.elasticOut,
      messageText: Align(
        alignment: Alignment.center,
        child: Text(
          content,
          style:
          TextStyle(color: Colors.white, fontFamily: 'QSM', fontSize: 20),
        ),
      ),
    )..show(context);
  }

  static showSuccessFlushBar(BuildContext context, String content) {
    Flushbar(
      duration: Duration(milliseconds: 2000),
      borderRadius: 10,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      flushbarPosition: FlushbarPosition.TOP,
      onStatusChanged: ((callBack) {}),
      backgroundColor: Colors.blueAccent,
      flushbarStyle: FlushbarStyle.FLOATING,
      boxShadows: [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(4, 9),
          blurRadius: 7,
        ),
      ],
      forwardAnimationCurve: Curves.elasticOut,
      messageText: Align(
        alignment: Alignment.center,
        child: Text(
          content,
          style:
          TextStyle(color: Colors.white, fontFamily: 'QSM', fontSize: 20),
        ),
      ),
    )..show(context);
  }
}
