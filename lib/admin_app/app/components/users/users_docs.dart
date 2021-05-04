import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/common-components/Component.dart';

class UsersDoc extends StatefulWidget {
  @override
  _UsersDocState createState() => _UsersDocState();
}

class _UsersDocState extends State<UsersDoc> {
  @override
  Widget build(BuildContext context) {
    return Component(
        "Legacy Foundation",
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Name',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.display1,
//                            TextStyle(
//                              height: 3.0,
//                              fontSize: 18,
//                              fontWeight: FontWeight.bold,
//                            ),
                    )),
                    Expanded(
                        child: Text('Email',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.display1)),
                    Text('Role',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.display1),
                    Expanded(
                        child: Text('Date Created',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.display1)),
                    Expanded(
                        child: Text('Date Edited',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.display1)),
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
                                title: new Row(children: <Widget>[
                              Expanded(
                                child: Text(
                                  'User’s Name',
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'coolemail@email.com',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Role Name',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '10/21/2017',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '06/12/2019',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.black, size: 15),
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, '/dashBoard')),
                            ])),
                          ],
                        )),
              )),
            ],
          ),
        ));
  }
}
