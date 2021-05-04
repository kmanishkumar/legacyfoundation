import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/audit_logs/display.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_log_note2.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/webView_user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:legacy_foundations/app/components/common-components/Component.dart';

class NotesLog extends StatefulWidget {
  @override
  _NotesLogState createState() => _NotesLogState();
}

class _NotesLogState extends State<NotesLog> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  String type = "note";
  bool val = true;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    var provider = Provider.of<LoginProvider>(context,listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Notes Log History",
              style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
        body: AsyncLoader(
          key: _asyncLoaderState,
          initState: () async => await _apiService.getNotesByUserId(),
          renderLoad: () => Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          ),
          renderError: ([err]) => Text('Has Error'),
          renderSuccess: ({data}) => notesLog(data, provider),
        ));
  }

  notesLog(data, provider) {
    print(data);

    if (data == null) {
      return Container();
    } else if (data.notes == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.notes;
      print(values.content);

      debugPrint("values inside$values");

      return Container(
//        color: Colors.green,
        child: RefreshIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          onRefresh: () => _asyncLoaderState.currentState.reloadState(),
          child: ListView.builder(
            itemCount: values.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AuditNote(
                              responseData: values[index],
                            )));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
//                              margin: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  values[index].title,
                                  style: Theme.of(context).textTheme.display3,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.grey, size: 17),
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
//                              margin: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _getDate(values[index].createdAt) +
                                      " " +
                                      _getTime(values[index].createdAt),
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: new BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
            ),
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 15),
      );
    }
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
