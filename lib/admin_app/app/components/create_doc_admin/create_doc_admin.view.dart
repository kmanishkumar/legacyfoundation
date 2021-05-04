import 'dart:convert';

import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/create_doc_admin/create_doc_admin.methods.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/create_web_doc.dart';
import 'package:found_legacy/models/get_all_cat.model.dart';
import 'package:found_legacy/models/get_all_users.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CreateDocAdmin extends StatefulWidget {
  @override
  _CreateDocAdminState createState() => _CreateDocAdminState();
}

class _CreateDocAdminState extends State<CreateDocAdmin> {
  Category _selectedCat;
  User _user;
  var _documentName = TextEditingController();
  var _to = TextEditingController();

  @override
  Widget build(BuildContext context) {
//    _documentName.text = 'https://oncourse.sfo2.digitaloceanspaces.com/docusign/arlpswsk55982ft1578485017432.pdf';
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;



    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () => Navigator.of(context).pop()),
          title: Text(
            'Create Document',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: blockSizeVertical * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: blockSize * 35,
                  margin: EdgeInsets.only(
                      right: blockSize * 1, left: blockSize * 5),
                  child: Text(
                    'Document Category',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
                AsyncLoader(
                  initState: () => CreateDocAdminMethods.getAllCat(),
                  renderLoad: () => RefreshProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                  renderError: ([err]) =>
                      Text('There was a error getting category'),
                  renderSuccess: ({data}) => _geneateDropDown(data),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
//                          color: Colors.pink,
                  width: blockSize * 20,
                  margin: EdgeInsets.only(
                      right: blockSize * 20, left: blockSize * 5, top:blockSizeVertical *1, bottom:blockSizeVertical *2 ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Document Name",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: blockSize * 30),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                            controller: _documentName,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
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
                  width: blockSize * 20,
                  margin: EdgeInsets.only(
                      right: blockSize * 20, left: blockSize * 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Document ID",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      )),
                ),
                Expanded(
                  child: Container(
//                            color: Colors.green,
                    width: blockSize * 60,
                    margin: EdgeInsets.only(right: blockSize * 30),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      initialValue: 'Auto-generated',
                      readOnly: true,
//                            controller: _email,
//                            validator: _validateEmail,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: blockSizeVertical * 7,
            ),
            GestureDetector(
              onTap: () {
                Map map = {
                  'category': _selectedCat.id,
                  'name':_documentName.text,
                  'template': true,
                };
                var x = json.encode(map);
                print(x);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => WebViewLoaderCreate(data: x.toString())));
              },
              child: SizedBox(
                width: blockSize * 100,
                height: blockSizeVertical * 10,
                child: Text(
                  'Upload Document',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ));
  }

  _geneateDropDown(GetAllCat data) {
    List<Category> _catList = data.categories;
    List<DropdownMenuItem<Category>> _dropdownMenuItems;
    _dropdownMenuItems = buildDropdownMenuItems(_catList);

    return Center(
      child: Container(
          margin: EdgeInsets.only(left: 30),
          height: 40,
          width: 200,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0, style: BorderStyle.solid, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          //DropDownButton is hiding the bottom line from the user view
          child: Theme(
            data: Theme.of(context).copyWith(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                canvasColor: Colors.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down),
                value: _selectedCat,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedCat = value;
                  });
                },
                isExpanded: true,
              ),
            ),
          )),
    );
  }

  List<DropdownMenuItem<Category>> buildDropdownMenuItems(
      List<Category> catList) {
    List<DropdownMenuItem<Category>> items = List();
    for (Category company in catList) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(
            company.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      );
    }
    return items;
  }

  _generateUsersDropDown(GetAllUsers users){

    List<User> _catList = users.user;
    List<DropdownMenuItem<User>> _dropdownMenuItems;
    _dropdownMenuItems = buildDropdownMenuItemsUsers(_catList);

    return Center(
      child: Container(
          margin: EdgeInsets.only(left: 30),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0, style: BorderStyle.solid, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          //DropDownButton is hiding the bottom line from the user view
          child: Theme(
            data: Theme.of(context).copyWith(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                canvasColor: Colors.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down),
                value: _selectedCat,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedCat = value;
                  });
                },
                isExpanded: true,
              ),
            ),
          )),
    );

  }

  List<DropdownMenuItem<User>> buildDropdownMenuItemsUsers(
      List<User> catList) {
    List<DropdownMenuItem<User>> items = List();
    for (User company in catList) {
      items.add(
        DropdownMenuItem(
          value: _user,
          child: Text(
            company.info.email,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      );
    }
    return items;
  }
}
