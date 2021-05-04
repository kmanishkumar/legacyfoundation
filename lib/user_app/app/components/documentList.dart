import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
//import 'package:legacy_foundations/app/components/common-components/Component.dart';




class DocList extends StatefulWidget {




  @override
  _DocListState createState() => _DocListState();
}

class _DocListState extends State<DocList> {
  final List<String> items = [
    "Pre-Task Planning",
    "Drill Log",
    "Drilled Shaft Inspection",
    "Reinforcement Rebar\nField Check",
    "Bottom Hole Check",
    "Concrete Placement\nLog and Graph",
  ];

  @override
  Widget build(BuildContext context) {
    return Component(
      'Document List',
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(items[index], style: Theme.of(context).textTheme.display3),
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
          );
//    return CustomListItem
        },
      ),
    );
  }
}
