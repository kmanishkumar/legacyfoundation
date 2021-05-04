import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/common/Util.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_note_history0.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/dashboard/bottom_nav_bar.dart';
import 'package:found_legacy/user_app/app/components/note/edit_note.dart';
import 'package:found_legacy/user_app/app/components/note/getNotesById.dart';
import 'package:found_legacy/user_app/app/providers/createNote_provider.dart';
import 'package:provider/provider.dart';

class CreateNote extends StatefulWidget {
  CreateNote({Key key}) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String dropdownValue = 'Select Job..';

  final _titleText = TextEditingController();
  final _contentText = TextEditingController();

  ApiService _apiService = ApiService();

  bool confirmToSubmit = false;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final noteProvider = Provider.of<NoteProvider>(context,listen: false);

    // final _statusGap = MediaQuery.of(context).padding.top + 20;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("Create Note", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
//              Container(
//                margin: EdgeInsets.all(15),
//                width: _width,
//                child: SizedBox(
//                  child: Theme(
//                    data: Theme.of(context).copyWith(
//                      canvasColor: Colors.white,
////              scaffoldBackgroundColor: Colors.pink
//                    ),
//                    child: DropdownButton<String>(
//                      isExpanded: true,
//                      value: dropdownValue,
//                      icon: Icon(
//                        Icons.arrow_drop_down,
//                        color: Colors.black,
//                        size: 30,
//                      ),
//                      iconSize: 24,
//                      elevation: 16,
//                      style: TextStyle(color: Colors.grey, inherit: true),
//                      underline: Container(
//                        height: 2,
//                        color: Colors.grey,
//                      ),
//                      onChanged: (String newValue) {
//                        setState(() {
//                          dropdownValue = newValue;
//                        });
//                      },
//                      items: <String>[
//                        'Select Job..',
//                        'Safety Forms',
//                        'Equipment Inspection',
//                        'Policy',
//                        'Notes',
//                        '2019  Injury Illness plan',
//                        'Drilled Shaft Forms'
//                      ].map<DropdownMenuItem<String>>((String value) {
//                        return DropdownMenuItem<String>(
//                          value: value,
//                          child: Text(value),
//                        );
//                      }).toList(),
//                    ),
//                  ),
//                ),
//              ),
              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, bottom: 1, top: 10),
                width: _width,
                child: TextField(
                  controller: _titleText,
                  style: TextStyle(
                      color: Colors.black, decoration: TextDecoration.none),
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Enter title here…",
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
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                  width: _width,
//        child: Padding(
//          padding: const EdgeInsets.all(1.0),
                  child: TextField(
                    controller: _contentText,
                    style: TextStyle(
                        color: Colors.black, decoration: TextDecoration.none),
                    minLines: 20,
                    maxLines: 20,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Enter note here…",
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
//        ),
                ),
              ),
              confirmToSubmit == false
                  ? Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            confirmToSubmit = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.red,
//                              !confirmToSubmit
//                                  ? Colors.red
//                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Confirm",
//                                !confirmToSubmit ? "Confirm" : "Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    )
                  : Container(
                      child: GestureDetector(
                        onTap: () {
                          confirmAndProceed(noteProvider);
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.green,
//                              confirmToSubmit == false
//                                  ? Colors.red
//                                  : Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Submit",
//                                confirmToSubmit == false ? "Confirm" : "Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    )
            ],
          ),
        ));
  }

  void confirmAndProceed(NoteProvider noteProvider) async {
    final userId = await UserUtil.sharePrefsUserId();
    print("User ID in CreateNote Screen==> $userId");

    String title = noteProvider.setTitle = _titleText.text;
    print("Title==>$title");

    String content = noteProvider.setContent = _contentText.text;
    print("Content==>$content");

    var createNote = {"userId": userId, "title": title, "content": content};
    print("createNoteData==>$createNote");

    var response = await _apiService.createNote(createNote);

    print(response);
    print(response.resMsg);

    if (response.resMsg == 'success') {
      Flushbar(
        message: response.message,
//        icon: Icon(Icons.cre),
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

//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (_) => GetNotesById()));

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavBar(2)));
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "Error while Creating Note",
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
    }
  }
}
