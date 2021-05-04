import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/models/user_audit.model.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_methods.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/webView_read.dart';
import 'package:intl/intl.dart';

import 'audit_log_note2.dart';


class AuditLogNotes extends StatefulWidget {
  @override
  _AuditLogNotesState createState() => _AuditLogNotesState();
}

class _AuditLogNotesState extends State<AuditLogNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Audit Log", style: Theme
              .of(context)
              .textTheme
              .headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
      body:AsyncLoader(
        initState: ()=>AuditMethods.getUserAuditLogs(),
        renderLoad: ()=>Center(
          child: RefreshProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation(Colors.black),
          ),
        ),
        renderError: ([err])=>Center(
          child: Text('Something went wromg.'),
        ),
        renderSuccess: ({data})=>_generateBody(data),
      )
    );
  }

  _generateBody(UserAuditLogs data) {




    return ListView.builder(
      itemCount: data.logs.length,
      itemBuilder: (context,index){

        return InkWell(
          onTap: (){
            print(data.logs.elementAt(index).type);
            if(data.logs.elementAt(index).type == 'note'){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AuditNote(
                responseData: data.logs.elementAt(index),
              )));
            }
            if(data.logs.elementAt(index).type == 'document'){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UserWebViewUpdate(
                responseData: data.logs.elementAt(index).documentId,
              )));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(27.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: new EdgeInsets.only(right: 13.0),
                                child: Text(
                                  data.logs.elementAt(index).name==null ?
                                  '' : data.logs.elementAt(index).name,style: TextStyle(
                                    fontSize: 20
                                ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Container(
                                child: Text(
                                  data.logs.elementAt(index).category==null ? '' : '- ' +data.logs.elementAt(index).category,
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              _formatDateAuditLogs(data.logs.elementAt(index).createdAt),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  Divider(
                    color: Colors.blueGrey,
                    height: 0.2,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        );
      },
    );
  }


  String _formatDate(DateTime modifiedAt) {
    return DateFormat.yMd().format(modifiedAt).toString() +
        '\n' +
        DateFormat.jm().format(modifiedAt).toString();
  }

  String _formatDateAuditLogs(String modifiedAt) {

    DateTime dateTime=DateTime.parse(modifiedAt);
    return DateFormat.yMd().format(dateTime).toString() +
        '  @ ' +
        DateFormat.jm().format(dateTime).toString();
  }

}
