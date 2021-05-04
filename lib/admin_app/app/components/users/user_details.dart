import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:found_legacy/admin_app/app/components/documents/create_document.dart';
import 'package:found_legacy/admin_app/app/components/common-components/Component.dart';
import 'package:found_legacy/admin_app/app/components/roles/roles_switch.dart';
import 'package:found_legacy/admin_app/app/components/users/user_details_tabview.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List _documents = [
    'Role Name',
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

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;
    final blockSizeVertical = _height / 100;

    return Component(
      "Legacy Foundation",
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text('John Smith'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: SizedBox(
                        width: 85,
                        height: 35,
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Delete User',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CreateDoc()));
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RolesSwitch()));
                      },
                      child: SizedBox(
                        width: 85,
                        height: 35,
                        child: Card(
                          elevation: 10,
                          color: Colors.green,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Save',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text('JohnSmith@email.com'),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Role:"),
              ),
              Container(
                child: new Center(
                    child: Container(
                  width: (blockSize * 60) - 25,
                  height: blockSizeVertical * 5,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  foregroundDecoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: SizedBox(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          canvasColor: Colors.grey),
                      child: new DropdownButton(
                        isExpanded: true,
                        hint: Text(
                          "Role Name",
                          style: TextStyle(fontSize: 5),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
//                          size: 30,
                        ),
//                        iconSize: 24,
                        elevation: 15,
                        underline: Container(
                          height: 0,
                        ),
                        value: _currentDoc,
                        items: _dropDownMenuItems,
                        onChanged: changedDropDownItem,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(10), child: UserDetailsTabView()))
        ],
      ),
    );
  }

  void changedDropDownItem(String value) {
    _currentDoc = value;
  }
}
