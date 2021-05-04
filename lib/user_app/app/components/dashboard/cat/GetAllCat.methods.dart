import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/models/get_all_cat.model.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';
import 'package:found_legacy/user_app/app/components/webDocs/docs_list.dart';

class GetAllCatMethods {
  //api
  static Future<GetAllCat> getAllCat() {
    final apiCall = RestClient(DioClient.getDio());

    return apiCall.getAllCat().then((data) {
      return data;
    }).catchError((e) {
      final error = (e as DioError).response;
      throw Exception(error);
    });
  }





  static generateCatList(GetAllCat getAllCat) {
    final catList = getAllCat.categories;

    return ListView.builder(
      itemCount: catList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DocsOfCategory(name: catList.elementAt(index).name,id: catList.elementAt(index).id,)));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(catList.elementAt(index).name),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
