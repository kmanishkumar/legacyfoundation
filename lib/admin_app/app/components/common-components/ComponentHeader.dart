
import 'package:flutter/material.dart';
import 'header.dart';

class ComponentHeader extends StatelessWidget{
  final Widget _body;
    final int index;
  ComponentHeader(this._body,{this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerView(context),
    body: Container(
        child: _body,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.white,Colors.white],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),

    );
  }
}