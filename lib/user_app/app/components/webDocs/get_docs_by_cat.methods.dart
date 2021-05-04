import 'package:dio/dio.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';

class GetDocsByMethods{


  static getDocsByCAt(String id){

    final apiCall=RestClient(DioClient.getDio());
    return apiCall.getDocsByCat(id).then((data){

      return data;

    }).catchError((err){

      final error=(err as DioError).response;
      throw Exception(error);

    });
  }


}