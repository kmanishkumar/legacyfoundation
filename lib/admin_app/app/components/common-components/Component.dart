import 'package:flutter/material.dart';

class Component extends StatefulWidget {
  final String _appBarTitle;
  final _body;
  Component(this._appBarTitle, this._body, {Key key}) : super(key: key);

  @override
  _ComponentState createState() => _ComponentState(_appBarTitle,_body);
}

class _ComponentState extends State<Component> {
  final String _appBarTitle;
  final Widget _body;

  _ComponentState(this._appBarTitle, this._body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          _appBarTitle,
          style: Theme.of(context).textTheme.headline,
        ),

      ),
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
