import 'package:flutter/material.dart';

class AuditLog extends StatefulWidget {
  @override
  _AuditLogState createState() => _AuditLogState();
}

class _AuditLogState extends State<AuditLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                      flex: 1,
                      child: Text('Type',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.display1)),
//                  Text(
//                    'Status',
//                    textAlign: TextAlign.center,
//                    style: Theme.of(context).textTheme.display4,
//                  ),
//                  Expanded(
//                      child: Text(
//                    'Last Change',
//                    textAlign: TextAlign.center,
//                    style: Theme.of(context).textTheme.display4,
//                  )),
                ]),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => Column(
                        children: <Widget>[
                          ListTile(
                            title: Row(children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Document Name - Document Category',
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
//                              Text(
//                                'Completed',
//                                textAlign: TextAlign.center,
//                                style: Theme.of(context).textTheme.body1,
//                              ),
//                              Expanded(
//                                child: Text(
//                                  '08/12/2019 ',
//                                  textAlign: TextAlign.center,
//                                  style: Theme.of(context).textTheme.body1,
//                                ),
//                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.black, size: 15),
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, '/dashBoard')),
                            ]),
                            subtitle: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '09/31/2019 @ 3:34 pm',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
//                                Expanded(
//                                  child: Text(
//                                    '',
//                                    textAlign: TextAlign.center,
//                                    style: Theme.of(context).textTheme.body1,
//                                  ),
//                                ),
//                                Expanded(
//                                  child: Text(
//                                    '12:27 pm',
//                                    textAlign: TextAlign.start,
//                                    style: Theme.of(context).textTheme.body1,
//                                  ),
//                                ),
                              ],
                            ),
                            isThreeLine: true,
                            enabled: true,
                            dense: true,
                          ),
                        ],
                      )),
//              decoration: new BoxDecoration(
//                border: Border(
//                  top: BorderSide(
//                    color: Colors.black,
//                  ),
//                  bottom: BorderSide(
//                    color: Colors.black,
//                  ),
//                ),
//              ),
            )),
          ],
        ),
      )),
    );
  }
}
