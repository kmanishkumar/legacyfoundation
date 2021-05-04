import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_legacy/CustomWidget.dart';
import 'package:found_legacy/admin_app/app/components/roles/roleRepo.dart';

import 'package:found_legacy/user_app/app/components/note/create_note.dart';
import 'package:found_legacy/user_app/app/components/note/notes_log1.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';
import 'package:found_legacy/services/api_services.dart';

class AuditNote extends StatefulWidget {
  var responseData;

  AuditNote({this.responseData});

  @override
  _AuditNoteState createState() => _AuditNoteState();
}

class _AuditNoteState extends State<AuditNote> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  ApiService _apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    final _width = MediaQuery.of(context).size.width;

    final _statusGap = MediaQuery.of(context).padding.top + 20;

    var data = widget.responseData;
    print("manish data");
     print(data);

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
//            onPressed: () => Navigator.pushReplacement(
//                context, MaterialPageRoute(builder: (_) => NotesLog())),
          ),
          title: Text("Note", style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
                icon:Icon(
                  Icons.forward_to_inbox,
                  color: Colors.black,
                  size: 22,
                ),
                onPressed: ()=>{
                  _showDialog(context)
                }
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
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
                                _getDate(data.createdAt) +
                                    " @ " +
                                    _getTime(data.createdAt),
//                                '10/08/2019 @ 2:15pm',
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
//                    'Drill Job 1B7VC2',
                    data.name,
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
                    child: TextFormField(
                      readOnly: true,
//                      enabled: false,
                      enableInteractiveSelection: false,
                      style: TextStyle(
                          color: Colors.black, decoration: TextDecoration.none),
                      minLines: 20,
                      maxLines: 20,
                      autocorrect: false,
                      decoration: InputDecoration(
//                        hintText: "Note contents",
                        hintText: data.content,
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

  Future<void> _showDialog(BuildContext context) {
    var data = widget.responseData;
    var email = TextEditingController();
    print(data);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black87)),
              title: Text(
                  "Email",
                  style: TextStyle(
                      fontStyle: FontStyle.normal
                  )
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Container(
                      height: 40,
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: new TextField(
                        autofocus: true,
                        controller: email,
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          contentPadding:EdgeInsets.only(left: 5,bottom: 10) ,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 100,
                            // margin: EdgeInsets.all(20),
                            child: FlatButton(
                              child: Text('Cancel'),
                              color: Colors.black12,
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 30,),
                        Container(
                          width: 100,
                          // margin: EdgeInsets.all(20),
                          child: FlatButton(
                            child: Text('Send'),
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            onPressed: () async{
                              if(isNull(email.text)){
                                CustomWidgets.showSuccessFlushBar(context, "Enter Your Email");
                              }
                              else{
                                print(email.text);
                                print(data.content);
                               await sendMail(email.text, data.content);
                               Navigator.pop(context);
                              CustomWidgets.showSuccessFlushBar(context, "Notes send to Your Mail");
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
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

  sendMail(String email, String content) async {
    var data = {"email": email, "note": content};

    var res = await _apiService.senMail(data);

    print(res);

  }
}
