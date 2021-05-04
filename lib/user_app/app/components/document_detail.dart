import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
//import 'package:legacy_foundations/app/components/common-components/Component.dart';

class DocumentDetail extends StatefulWidget {
  @override
  _DocumentDetailState createState() => _DocumentDetailState();
}

class _DocumentDetailState extends State<DocumentDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var blockSize = width / 100;
    var blockSizeVertical = height / 100;
    void showAlertSubmitted() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new CupertinoAlertDialog(
              title: new Text("Incomplete From"),
              content: new Text("You have not filled out all requiredfields"),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: new Text("Dismiss"),
                    onPressed: () {
                      Navigator.pop(context, 'Dismiss');
                    }),
              ],
            );
          });
    }

    void showAlert() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new CupertinoAlertDialog(
              title: new Text("Document Submitted"),
              content: new Text(
                  "This document has been submitted to HQ and is accessible in the audit log."),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: new Text("Dismiss"),
                    onPressed: () {
                      Navigator.pop(context, 'Dismiss');
                      showAlertSubmitted();
                    }),
              ],
            );
          });
    }

    return Component(
        'Document Name',
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
                color: Colors.black12,
                width: blockSize * 91.6,
                height: blockSizeVertical * 100,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                child: Center(
                  child: Text('Interactable/Zoom/Fillable Document'),
                )),
            SizedBox(
              width: blockSize * 91.6, // match_parent
              height: blockSizeVertical * 12,
              child: Padding(
                padding: EdgeInsets.only(bottom: blockSizeVertical * 4),
                child: RaisedButton(
                    color: Colors.white,
                    onPressed: showAlert,
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                    child: Text('Complete',
                        style: Theme.of(context).textTheme.display3)),
              ),
            )
          ],
        ));
  }
}
