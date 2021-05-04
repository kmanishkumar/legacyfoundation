import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/note/getNotesById.dart';

import '../../../../services/api_services.dart';

class EditNote extends StatefulWidget {
  var responseData;

  EditNote({this.responseData});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  List _documents = [
    'Drill Job 1B7VC2',
    'Select Job..',
    'Safety Forms',
    'Equipment Inspection',
    'Policy',
    'Notes',
    '2019  Injury Illness plan',
    'Drilled Shaft Forms',
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _currentDoc;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentDoc = _dropDownMenuItems[0].value;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String docs in _documents) {
      items.add(new DropdownMenuItem(value: docs, child: new Text(docs)));
    }
    return items;
  }

  final _titleText = TextEditingController();
  final _contentText = TextEditingController();

  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    debugPrint("responseData in editData screeen");
    print(widget.responseData);

    var notesData = widget.responseData;

    _titleText.text = notesData.title;
    _contentText.text = notesData.content;

    return Component(
        'Edit Note',
        Center(
          child: Column(
            children: <Widget>[
//              Container(
//                margin: EdgeInsets.only(left: 5, right: 5),
//                child: new Center(
//                    child: Container(
//                  margin:
//                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
//                  width: _width,
//                  child: SizedBox(
//                    child: Theme(
//                      data: Theme.of(context).copyWith(
//                        canvasColor: Colors.white,
////              scaffoldBackgroundColor: Colors.pink
//                      ),
//                      child: new DropdownButton(
//                        isExpanded: true,
//                        hint: Text(
//                          "Drill Job 1B7VC2",
//                        ),
//                        icon: Icon(
//                          Icons.arrow_drop_down,
//                          color: Colors.black,
//                          size: 30,
//                        ),
//                        iconSize: 24,
//                        elevation: 15,
//                        underline: Container(
//                          height: 1,
//                          color: Colors.grey,
//                        ),
//                        value: _currentDoc,
//                        items: _dropDownMenuItems,
//                        onChanged: changedDropDownItem,
//                        style: TextStyle(
//                          color: Colors.black,
//                        ),
//                      ),
//                    ),
//                  ),
//                )),
//              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, bottom: 1, top: 10),
                width: _width,
                child: TextFormField(
                  controller: _titleText,
                  style: TextStyle(
                      color: Colors.black, decoration: TextDecoration.none),
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: notesData.title,
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
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black, decoration: TextDecoration.none),
                    minLines: 20,
                    maxLines: 20,
                    autocorrect: false,
                    controller: _contentText,
                    decoration: InputDecoration(
                      hintText: notesData.content,
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
              GestureDetector(
                onTap: () {
                  confirmAndProceed();
                },
                child: Container(
                  height: 50,
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ));
  }

  void changedDropDownItem(String value) {
    setState(() {
      _currentDoc = value;
    });
  }

  void confirmAndProceed() async {
    String title = _titleText.text;
    String content = _contentText.text;
    String userId = widget.responseData.userId;
    print(userId);
    String noteId = widget.responseData.sId;
    var updateNote = {"title": title, "content": content};
    print("UpdateNoteData==>$updateNote");
    var response = await _apiService.updateNote(updateNote, noteId);
    print(response);
    print(response.resMsg);

    if (response.resMsg == 'success') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => GetNotesById()));
    } else if (response.resMsg == "failure") {
      debugPrint("before flushbar");
      Flushbar(
        message: "Error while updating note",
        icon: Icon(Icons.info_outline),
        duration: Duration(seconds: 5),
        leftBarIndicatorColor: Colors.red,
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.black]),
        animationDuration: Duration(seconds: 2),
        flushbarStyle: FlushbarStyle.FLOATING,
        isDismissible: true,
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
      Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: Text(
              'Sorry, there was an error loading your Api',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ));
    }
  }
}
