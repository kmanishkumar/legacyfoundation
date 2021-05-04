import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';

class AuditLog extends StatefulWidget {
  @override
  _AuditLogState createState() => _AuditLogState();
}

class _AuditLogState extends State<AuditLog> {
  @override
  Widget build(BuildContext context) {
    return Component(
      'Audit Log',
      ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
                title: Text('Type', style: Theme.of(context).textTheme.body1),
                subtitle: Text('10/08/2019 @ 2:15 pm',
                    style: Theme.of(context).textTheme.body1),
                trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, size: 17),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/auditNote'))),
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
          );
//    return CustomListItem
        },
      ),
    );
  }
}
