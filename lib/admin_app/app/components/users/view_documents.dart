import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';

import 'package:found_legacy/services/api_services.dart';
import 'package:intl/intl.dart';

class ViewDocuments extends StatefulWidget {
  @override
  _ViewDocumentsState createState() => _ViewDocumentsState();
}

class _ViewDocumentsState extends State<ViewDocuments> {
  ApiService _apiService = ApiService();

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
    final _statusGap = MediaQuery.of(context).padding.top + 20;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        margin: EdgeInsets.only(
            top: _statusGap + 10, right: 10, left: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                      child: Text('Name',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.display4)),
                  Expanded(
                    child: Text(
                      'Status',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display4,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    'Last Change',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.display4,
                  )),
                ]),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            Expanded(
              child: FutureBuilder(
                future: _apiService.getDocuments(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
//                  debugPrint("snapshot has data");
//                  debugPrint(snapshot.data);
//                  switch (snapshot.connectionState) {
//                    case ConnectionState.none:
//                      return Container();
//                    case ConnectionState.waiting:
//                      return CircularProgressIndicator();
//                    case ConnectionState.active:
//                    // ignore: missing_return
//                    case ConnectionState.done:
//                      if (snapshot.hasError) {
//                        return Text("error${snapshot.error}");
//                      } else if (snapshot.data == null) {
//                        return CircularProgressIndicator();
//                      } else {
//                        return createDocumentsView(context, snapshot);
//                      }
//                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Waiting to start');
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null) {
                        return Text(
                            "Error Occured while Connecting to the DataBase");
                      } else {
                        return createDocumentsView(context, snapshot);
                      }
                  }

//                  if (snapshot.data == null) {
//                    return Container(
//                      child: CircularProgressIndicator(
//                        backgroundColor: Colors.red,
//                      ),
//                    );
//                  } else {
//                    return createDocumentsView(context, snapshot);
//                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget createDocumentsView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data.documents;
    var toEmail = snapshot.data.documents[0]._to[0].email;
//    var toEmail=snapshot.data.documents;

    debugPrint("values inside$values");

//    var data = values.modifiedAt;
//    var day = values.modifiedAt;

    return Container(
      child: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    title: Row(children: <Widget>[
                      Expanded(
                        child: Text(
                          values[index].name,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Text(
                        'Completed',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Expanded(
                        child: Text(
//                          _getDate(data),
                          _getDate(values[index].modifiedAt),

//                          '08/12/2019 ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.black, size: 18),
//                      onPressed: () => Navigator.pushReplacementNamed(
//                          context, '/dashBoard'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UsersListScreen()));
                        },
                      ),
                    ]),
                    subtitle: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Sent to: $toEmail",
//                            'Sent to: Name, Name, Name,',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Expanded(
                          child: Text(
//                            _getTime(day),
                            _getTime(values[index].modifiedAt),

//                            '12:27 pm',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    enabled: true,
                    dense: true,
                  ),
                ],
              )),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black,
          ),
          bottom: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  String _getDate(data) {
    var date = DateTime.parse(data.toString()).toLocal();
    return DateFormat("MM/dd/yyyy").format(date).toString();
  }

  String _getTime(day) {
    var date = DateTime.parse(day.toString())
        .toLocal(); //toLocal=> if we need local time
    return DateFormat("h:mm a").format(date).toString();
  }
}
