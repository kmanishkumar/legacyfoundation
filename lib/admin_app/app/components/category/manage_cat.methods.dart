import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_legacy/admin_app/app/components/category/manage_cat.bloc.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:validators/validators.dart';

class ManageCatMethods {
  static getAllCat(ManageCatBloc manageCatBloc) {
    final apiCall = RestClient(DioClient.getDio());

    return apiCall.getAllCategory().then((data) {
      manageCatBloc.setCatModel = data;
      manageCatBloc.refreshController.refreshCompleted();

      return null;
    }).catchError((err) {
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }

  static createCat(BuildContext context, Map map, ManageCatBloc manageCatBloc) {
    ApiService apiService = ApiService();

    apiService.createCat(map).whenComplete(() {
      getAllCat(manageCatBloc);
    });
//    final apiCall = RestClient(DioClient.getDio());
//
//    return apiCall.createCat(json.encode(map)).then((data) {
//      showFlushBar(context, data.message);
//    }).catchError((err) {
//      final error = (err as DioError).response;
//      throw Exception(error);
//    });
  }

  static deleteCat(BuildContext context, String id,
      ManageCatBloc manageCatBloc) {
    final apiCall = RestClient(DioClient.getDio());

    return apiCall.deleteCat(id).then((data) {
      showFlushBar(context, 'Category deleted');
      getAllCat(manageCatBloc);
    }).catchError((err) {
      showFlushBar(context, 'Unable to delete the category');
    });
  }

  static updateCat(BuildContext context, String id, Map map, manageCatBloc) {
    ApiService apiService = ApiService();

    apiService.updateCat(id, map).whenComplete(() {
      getAllCat(manageCatBloc);
    });


//    final apiCall = RestClient(DioClient.getDio());
//
//    return apiCall.updateCat(json.encode(map)).then((data) {
//      showFlushBar(context, 'Category Updated');
//      getAllCat(manageCatBloc);
//    }).catchError((err) {
//      showFlushBar(context, 'Unable to update category.');
//    });
  }

  //view methods
  static generateCatList(BuildContext context, ManageCatBloc manageCatBloc) {
    final catList = manageCatBloc.categoryModel.categories;

    return ListView.builder(
      itemCount: catList.length,
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(catList
                          .elementAt(index)
                          .name),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'edit',
                    mini: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    onPressed: () =>
                        _updateCat(context, catList
                            .elementAt(index)
                            .name, catList
                            .elementAt(index)
                            .description, catList
                            .elementAt(index)
                            .sId, manageCatBloc),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    elevation: 0,
                    heroTag: 'delete',
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      deleteCat(
                          context, catList
                          .elementAt(index)
                          .sId, manageCatBloc);
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.black54,
                    ),
                  )
                ],
              )),
        );
      },
    );
  }

  static Future<bool> showCreateCat(BuildContext context,
      ManageCatBloc manageCatBloc) async {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    return await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: MediaQuery.removeViewInsets(
                removeLeft: true,
                removeRight: true,
                context: context,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 20,
                  title: Center(
                      child: Text(
                        'Create category',
                        style: TextStyle(
                            letterSpacing: 2.3,
                            color: Colors.black54,
                            fontFamily: 'QSB',
                            fontSize: 20),
                      )),
                  content: Container(
                    width: 250,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: 'Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descController,
                          decoration: InputDecoration(hintText: 'Description'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black45,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  _createCat(context,
                                      nameController.text, descController.text,
                                      manageCatBloc);
                                  Navigator.pop(context);
                                },

                                child: Icon(
                                  Icons.check,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: false,
      context: context,
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return null;
      },
    );
  }

  static _createCat(BuildContext context, String name, String desc,
      ManageCatBloc manageCatBloc) {
    if (isNull(name)) {
      showFlushBar(context, 'Please enter name');
    } else if (isNull(desc)) {
      showFlushBar(context, 'Please enter description.');
    } else {
      Map map = {
        "name": "$name",
        "description": "$desc",
      };

      createCat(context, map, manageCatBloc);
    }
  }

  static showFlushBar(BuildContext context, String message) {
    Flushbar(
      duration: Duration(seconds: 1),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    )
      ..show(context);
  }

  static _updateCat(BuildContext context, String name, String description,
      String id, ManageCatBloc manageCatBloc) async {
    final nameController = TextEditingController(text: name);
    final descController = TextEditingController(text: description);

    return await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: MediaQuery.removeViewInsets(
                removeLeft: true,
                removeRight: true,
                context: context,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 20,
                  title: Center(
                      child: Text(
                        'Update Category',
                        style: TextStyle(
                            letterSpacing: 2.3,
                            color: Colors.black54,
                            fontFamily: 'QSB',
                            fontSize: 20),
                      )),
                  content: Container(
                    width: 250,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: 'Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descController,
                          decoration: InputDecoration(hintText: 'Description'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black45,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  _updateCatValida(context, nameController.text,
                                      descController.text, id, manageCatBloc);
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: false,
      context: context,
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return null;
      },
    );
  }

  static _updateCatValida(BuildContext context, String name, String desc,
      String id, manageCatBloc) {
    if (isNull(name)) {
      showFlushBar(context, 'Please enter name');
    } else if (isNull(desc)) {
      showFlushBar(context, 'Please enter description.');
    } else {
      Map map = {
        "name": "$name",
        "description": "$desc",
      };

      updateCat(context, id, map, manageCatBloc);
    }
  }


}
