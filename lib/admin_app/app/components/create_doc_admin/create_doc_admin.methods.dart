import 'package:dio/dio.dart';
import 'package:found_legacy/models/get_all_cat.model.dart';
import 'package:found_legacy/models/get_all_users.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';

import '../../../../network/api.network.dart';
import '../../../../network/dio_client.dart';

class CreateDocAdminMethods {
  static Future<GetAllCat> getAllCat() {
    final apiCall = RestClient(DioClient.getDio());
    return apiCall.getAllCat().then((data) {
      return data;
    }).catchError((err) {
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }

  static Future<GetAllUsers> getAllUsers() {
    final apiCall = RestClient(DioClient.getDio());
    return apiCall.getAllUsers().then((data) {
      return data;
    }).catchError((err) {
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }
}

//view methods
