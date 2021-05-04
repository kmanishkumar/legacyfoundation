import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/UI/baseWidget.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                margin: EdgeInsets.all(50),
                color: Colors.blue,
                child: BaseWidget(
                  builder: (context, sizingInfo) =>
                      Text(sizingInformation.toString()),
                ),
              ),
              Text(sizingInformation.toString()),
            ],
          ),
        ),
      );
    });
  }
}
