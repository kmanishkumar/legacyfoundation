//import 'package:flutter/material.dart';
//
//class StatusDialog extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return StatusDialogState();
//  }
//}
//
//class StatusDialogState extends State<StatusDialog> {
//  String _selectedText = "SSD";
//
//  @override
//  Widget build(BuildContext context) {
//    return AlertDialog(
//      title: Text("Status Update"),
//      content: new DropdownButton<String>(
//        hint: Text("Status"),
//        value: _selectedText,
//        items: <String>['SDD', 'Meeting', 'Home', 'Space'].map((String value) {
//          return new DropdownMenuItem<String>(
//            value: value,
//            child: new Text(value),
//          );
//        }).toList(),
//        onChanged: (String val) {
//          _selectedText = val;
//          setState(() {
//            _selectedText = val;
//          });
//        },
//      ),
//      actions: <Widget>[
//        FlatButton(
//          child: Text("UPDATE"),
//          onPressed: () {
//            //.....
//            _buildStatusDialog();
//          },
//        ),
//      ],
//    );
//  }
//}
//
//void _buildStatusDialog() {
//  showDialog<void>(
////      context: context,
//      builder: (BuildContext context) {
//        return StatusDialog();
//      });
//}


import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Show Dialog'),
        backgroundColor: Color(0xff8c3a3a),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  _showAlertDialog(context);
                },
                child: new Icon(Icons.add_alert)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  _showDialog(context);
                },
                child: new Icon(Icons.slideshow)),
          ),
        ],
      ),
    );
  }

// Alert Dialog function
  void _showAlertDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// Show Dialog function
  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text('I am Title'),
          content: Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(' First Item'),
                    ),
                  ],
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(' Second Item'),
                    ),
                  ],
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.toys),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text('Third Item'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.FirstItem) {
      print('I First Item');
    } else if (choice == Constants.SecondItem) {
      print('I Second Item');
    } else if (choice == Constants.ThirdItem) {
      print('I Thired Item');
    }
  }
}

class Constants {
  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];
}