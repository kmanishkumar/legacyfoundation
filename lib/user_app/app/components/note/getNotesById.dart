import 'package:async_loader/async_loader.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_note_history0.dart';
import 'package:found_legacy/user_app/app/components/note/create_note.dart';

import 'package:found_legacy/user_app/app/components/note/edit_note.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';

import 'package:intl/intl.dart';

class GetNotesById extends StatefulWidget {
  @override
  _GetNotesByIdState createState() => _GetNotesByIdState();
}

class _GetNotesByIdState extends State<GetNotesById> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

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
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    return Scaffold(
      primary: true,
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
//          onPressed: () => Navigator.push(
//              context, MaterialPageRoute(builder: (_) => AuditLogNotes())),
        ),
        title: Text("Notes", style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
//          GestureDetector(
//            onTap: () {
//              Navigator.pushReplacement(
//                  context, MaterialPageRoute(builder: (_) => CreateNote()));
//            },
//            child: Align(
//              alignment: Alignment.centerRight,
//              child: Container(
//                width: 110,
//                height: 40,
//                margin: EdgeInsets.only(right: 10),
//                child: Card(
//                  elevation: 0,
//                  color: Colors.white,
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      'Create Note',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(color: Colors.blue),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
//                      width: blockSize * 33.33,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Title Content',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.display1),
                      ),
                    )),
                    Expanded(
                        child: Container(
//                      width: blockSize * 33.33,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Last Change',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    )),
                    Expanded(
                      child: Container(
//                        width: blockSize * 33.33,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Delete Note',
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                      ),
                    ),
                  ]),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              Expanded(
                child: AsyncLoader(
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
                  renderSuccess: ({data}) => getNotes(context, data),
                ),
              ),
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
    );
  }

  Widget getNotes(BuildContext context, data) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    print(data);

    if (data == null) {
      return Container();
    } else if (data.notes == null) {
      return Container(
        child: Center(
          child: Text("Unable to retrive Note Information\nNo note found\ :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.notes;
      debugPrint("values inside$values");
      return Container(
        child: RefreshIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          onRefresh: () => _asyncLoaderState.currentState.reloadState(),
          child: ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => EditNote(
                                        responseData: values[index],

                                      )));
                        },
                        child: Container(
//                          color: Colors.green,
                          child: ListTile(
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          values[index].title,
                                          style:
                                              Theme.of(context).textTheme.body1,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: blockSize * 2,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _getDate(values[index].modifiedAt),
                                          textAlign: TextAlign.start,
                                          style:
                                              Theme.of(context).textTheme.body1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: blockSize * 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.delete,
                                          color: Colors.black, size: 20),
                                      onPressed: () => showAlert(values[index]),
                                    ),
                                  ),
                                ]),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        values[index].content,
                                        style:
                                            Theme.of(context).textTheme.body1,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: blockSize * 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _getTime(values[index].modifiedAt),
                                        textAlign: TextAlign.start,
                                        style:
                                            Theme.of(context).textTheme.body1,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: blockSize * 2,
                                ),
                              ],
                            ),
                          ),
//                          decoration: new BoxDecoration(
//                            border: Border(
//                              top: BorderSide(
//                                color: Colors.white,
//                              ),
//                              bottom: BorderSide(
//                                color: Colors.grey,
//                              ),
//                            ),
//                          ),
                        ),
                      ),
                    ],
                  )),
        ),
//        decoration: new BoxDecoration(
//          border: Border(
//            top: BorderSide(
//              color: Colors.white,
//            ),
//            bottom: BorderSide(
//              color: Colors.grey,
//            ),
//          ),
//        ),
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

  void deleteNote({args}) async {
    var data = args;
    print(data);

    String noteId = NoteProvider().setNoteId = data.sId;
    print("NoteId==>$noteId");

    var deleteNote = noteId;
    print("createNoteData==>$deleteNote");

    var response = await _apiService.deleteNote(deleteNote);

    print(response.message);

    if (response.resMsg == 'success') {
      Flushbar(
        message: response.message,
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
        animationDuration: Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
        borderRadius: 90.0,
        margin: EdgeInsets.all(10),
        boxShadows: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(0.2, 1.8)),
        ],
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      )..show(context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => GetNotesById()));
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "error while deleting note",
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
        animationDuration: Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
        borderRadius: 90.0,
        margin: EdgeInsets.all(10),
        boxShadows: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(0.2, 1.8)),
        ],
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      )..show(context);
    } else {
      ErrorDescription("Someting is wrong");
    }
  }

  showAlert(value) {
    print(value);
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Delete Note"),
            content: new Text("Do you really want to delete?"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: new Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  deleteNote(args: value);

                  Navigator.of(context).pop();
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }
}
