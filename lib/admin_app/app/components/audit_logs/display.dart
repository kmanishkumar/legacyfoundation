import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:found_legacy/user_app/app/components/note/create_note.dart';

class AuditNoteDisplay extends StatefulWidget {
  var responseData;

  AuditNoteDisplay({this.responseData});

  @override
  _AuditNoteDisplayState createState() => _AuditNoteDisplayState();
}

class _AuditNoteDisplayState extends State<AuditNoteDisplay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    final _width = MediaQuery.of(context).size.width;

    final _statusGap = MediaQuery.of(context).padding.top + 20;

    var data = widget.responseData;
    print(data);

    final _header = Container(
      margin: EdgeInsets.only(top: _statusGap, left: 10, right: 10, bottom: 10),
      width: _width,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CreateNote()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        CupertinoIcons.back,
                        size: 32,
                        color: Colors.black,
                      )),
                )),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 100),
              child: Text(
                'Note',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 23, letterSpacing: 0.5),
              ),
            ),
          ],
        ),
      ),
    );

    final _infoBox = Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 20),
      width: _width,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Created on',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '10/08/2019 @ 2:15pm',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );

    final _id = Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 5, top: 20, right: 10, left: 10),
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Drill Job 1B7VC2',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );

    final _content = Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
        width: _width,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextField(
            style:
                TextStyle(color: Colors.black, decoration: TextDecoration.none),
            minLines: 20,
            maxLines: 20,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: "Note contents",
              hintStyle: TextStyle(color: Colors.grey),
              alignLabelWithHint: true,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: _statusGap, left: 10, right: 10, bottom: 10),
                width: _width,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CreateNote()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  CupertinoIcons.back,
                                  size: 32,
                                  color: Colors.black,
                                )),
                          )),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 100),
                        child: Text(
                          'Note',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 20),
                width: _width,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Created on',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '10/08/2019 @ 2:15pm',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(bottom: 5, top: 20, right: 10, left: 10),
                height: 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Drill Job 1B7VC2',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                  width: _width,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.black, decoration: TextDecoration.none),
                      minLines: 20,
                      maxLines: 20,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Note contents",
                        hintStyle: TextStyle(color: Colors.grey),
                        alignLabelWithHint: true,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
