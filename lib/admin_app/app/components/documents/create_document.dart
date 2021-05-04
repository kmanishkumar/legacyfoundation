import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/common-components/Component.dart';
import 'package:found_legacy/admin_app/app/components/users/users_docs.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/create_web_doc.dart';

class CreateDoc extends StatefulWidget {
  @override
  _CreateDocState createState() => _CreateDocState();
}

class _CreateDocState extends State<CreateDoc> {
  final formkey = GlobalKey<FormState>();
  bool _formValidate = false;

  List _documents = [
    'Drilled Shaft Forms',
    'Safety Forms	',
    'Equipment Inspection	',
    "Policy's ",
    'Notes',
    '2019  Injury Illness plan	',
    'Heat Illness Plan	',
    'Employee Contact List	',
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

  var _documentId = TextEditingController();


  TextEditingController _firstName = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;

    final _statusGap = MediaQuery.of(context).padding.top + 10;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
//              onPressed: () => Navigator.of(context).pop()
//          onPressed: () => Navigator.push(
//              context, MaterialPageRoute(builder: (_) => UsersListScreen())),
        ),
        centerTitle: true,
        title: Text("Create New Document",
            style: Theme.of(context).textTheme.headline),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
//          GestureDetector(
////            onTap: () => Navigator.pushReplacement(context,
////                MaterialPageRoute(builder: (_) => RolesListScreen())),
//            child: Align(
//              alignment: Alignment.centerRight,
//              child: Container(
//                width: 150,
//                height: 50,
//                margin: EdgeInsets.only(right: 30, left: 10),
//                child: Card(
//                  elevation: 0,
//                  color: Colors.white,
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      'Manage Roles',
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
                top: _statusGap + 10, bottom: 10, left: 50, right: 50),
            width: blockSize * 200,
            height: blockSizeVertical * 80,
            padding: EdgeInsets.only(bottom: 15, top: 15, right: 30, left: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
         ),
            child: Form(
              key: formkey,
              autovalidate: _formValidate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
//                          color: Colors.red,
                        width: blockSize * 40,
                        margin: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Document Category")),
                      ),
                      Expanded(
                        child: Container(
//                            color: Colors.yellow,
//                            height: blockSizeVertical * 10,
//                              width: (blockSize * 75) - 25,
                          width: blockSize * 60,
                          height: blockSizeVertical * 8,
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
                          foregroundDecoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black)),
                          child: SizedBox(
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  canvasColor: Colors.white),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
//                                   value: dropdownValue,
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
//                                  value: roleId,
//                                  onChanged: (String newValue) {
//                                    setState(() {
//                                      roleId = newValue;
//                                    });
//                                  },
//                                  items: sl.map((String value) {
//                                    return DropdownMenuItem<String>(
//                                      value: value.split('??')[1],
//                                      child: Text(value.split('??')[0]),
//                                    );
//                                  }).toList(),

                                  value: _currentDoc,
                                  items: _dropDownMenuItems,
                                  onChanged: changedDropDownItem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
//                          color: Colors.pink,
                        width: blockSize * 40,
                        margin: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Document Name")),
                      ),
                      Expanded(
                        child: Container(
//                            color: Colors.pink,
                          width: blockSize * 60,
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
//                            controller: _secondName,
//                              validator: _validateLastName,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
//                          color: Colors.green,
                        width: blockSize * 40,
                        margin: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Document ID")),
                      ),
                      Expanded(
                        child: Container(
//                            color: Colors.green,
                          width: blockSize * 60,
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            initialValue: 'Auto-generated',
                           readOnly: true,
//                            controller: _email,
//                            validator: _validateEmail,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                      )
                    ],
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
////                          color: Colors.yellow,
//                        width: blockSize * 40,
//                        margin: EdgeInsets.all(10),
//                        child: Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text("Job Number/Description")),
//                      ),
//                      Expanded(
//                        child: Container(
////                            color: Colors.yellow,
////                            height: blockSizeVertical * 10,
////                              width: (blockSize * 75) - 25,
//                          width: blockSize * 60,
//                          height: blockSizeVertical * 8,
//                          padding: EdgeInsets.all(10),
//                          margin:
//                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
//                          foregroundDecoration: BoxDecoration(
//                              color: Colors.transparent,
//                              borderRadius: BorderRadius.circular(0),
//                              border: Border.all(color: Colors.black)),
//                          child: SizedBox(
//                            child: Theme(
//                              data: Theme.of(context).copyWith(
//                                  materialTapTargetSize:
//                                      MaterialTapTargetSize.shrinkWrap,
//                                  canvasColor: Colors.white),
//                              child: DropdownButtonHideUnderline(
//                                child: DropdownButton<String>(
//                                  isExpanded: true,
////                                   value: dropdownValue,
//                                  icon: Icon(
//                                    Icons.arrow_downward,
//                                    color: Colors.black,
//                                  ),
//                                  iconSize: 24,
//                                  elevation: 16,
//                                  style: TextStyle(color: Colors.black),
//                                  underline: Container(
//                                    height: 1,
//                                    color: Colors.black,
//                                  ),
////                                  value: roleId,
////                                  onChanged: (String newValue) {
////                                    setState(() {
////                                      roleId = newValue;
////                                    });
////                                  },
////                                  items: sl.map((String value) {
////                                    return DropdownMenuItem<String>(
////                                      value: value.split('??')[1],
////                                      child: Text(value.split('??')[0]),
////                                    );
////                                  }).toList(),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
                  SizedBox(
                    height: blockSizeVertical * 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebViewLoaderCreate() ) );
                    },
                    child: SizedBox(
                      width: 140,
                      height: 70,
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Upload Document',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String value) {
    _currentDoc = value;
  }


  String _validateFirstName(String value) {
    Pattern pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);

    if (_firstName.text.isEmpty) {
      return "First Name is Required";
    } else if (!regExp.hasMatch(_firstName.text)) {
      return "Name must be a-z and A-Z";
    } else {
      return null;
    }
  }





}
