import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/note/getNotesById.dart';
import 'package:found_legacy/user_app/app/components/note/notes_log1.dart';

class AuditLogNotes extends StatefulWidget {
  @override
  _AuditLogNotesState createState() => _AuditLogNotesState();
}

class _AuditLogNotesState extends State<AuditLogNotes> {
  final List<String> items = [
    "Notes",
    "Documents",
    "Categorires",
    "Users",
    "Roles",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Audit Log", style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
//            onTap: () {
//              if (index == 0) {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (_) => GetNotesById()));
//              }
//            },

            onTap: () {
              if (index == 0) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NotesLog()));
              }
            },

            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      child: Text(items[index],
                          style: Theme.of(context).textTheme.display3)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, size: 17),
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
              padding: EdgeInsets.all(14),
            ),
          );
        },
      ),
    );
  }
}
