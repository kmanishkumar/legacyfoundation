
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/common-components/Component.dart';


class CreateDocument extends StatefulWidget {
  @override
  _CreateDocumentState createState() => _CreateDocumentState();
}

class _CreateDocumentState extends State<CreateDocument> {
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

  var _documentName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

//    final _dropDown = Container(
//      margin: EdgeInsets.all(5),
////      margin: EdgeInsets.only(left: 5, right: 5),
//      child: new Center(
//          child: Container(
//        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
//        width: _width,
//        child: SizedBox(
//          child: Theme(
//            data: Theme.of(context).copyWith(
//              canvasColor: Colors.black12,
////              scaffoldBackgroundColor: Colors.pink
//            ),
//            child: new DropdownButton(
//              isExpanded: true,
//              hint: Text(
//                "Drill Job 1B7VC2",
//              ),
//              icon: Icon(
//                Icons.arrow_drop_down,
//                color: Colors.black,
//                size: 30,
//              ),
//              iconSize: 24,
//              elevation: 15,
//              underline: Container(
//                height: 1,
//                color: Colors.grey,
//              ),
//              value: _currentDoc,
//              items: _dropDownMenuItems,
//              onChanged: changedDropDownItem,
//              style: TextStyle(
//                color: Colors.black,
//              ),
//            ),
//          ),
//        ),
//      )),
//    );

    return Component(
        "Create New Document",
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: blockSize * 25,
                    height: blockSizeVertical * 10,
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Document Category",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                  Container(
//                    margin: EdgeInsets.all(5),
                    child: new Center(
                        child: Container(
//                      decoration: BoxDecoration(
//                          color: Colors.yellow,
//                          borderRadius: BorderRadius.circular(10),
//                          border: Border.all(color: Colors.black)),
//                      margin: EdgeInsets.only(
//                          left: 10, right: 10, bottom: 20, top: 10),
//                      width: _width - 100,
//                        color: Colors.black,
                      width: (blockSize * 70) - 25,
                      height: blockSizeVertical * 10,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
//                      foregroundDecoration: BoxDecoration(
//                          color: Colors.transparent,
//                          borderRadius: BorderRadius.circular(10),
//                          border: Border.all(color: Colors.black)),
                      child: SizedBox(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            canvasColor: Colors.grey
                          ),
                          child: new DropdownButton(
                            isExpanded: true,
                            hint: Text(
                              "Drill Job 1B7VC2",
                              style: TextStyle(fontSize: 5),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 3,
                            ),
                            iconSize: 24,
                            elevation: 15,
                            underline: Container(
                              height: 0,
                            ),
                            value: _currentDoc,
                            items: _dropDownMenuItems,
                            onChanged: changedDropDownItem,
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                        ),
                      ),
                    )),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: blockSize * 25,
                    height: blockSizeVertical * 10,
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Document Name",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),

//

                  Container(
                    color: Colors.purple,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Container(
                        child: Text("asfadfads"),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void changedDropDownItem(String value) {
    setState(() {
      _currentDoc = value;
    });
  }
}
