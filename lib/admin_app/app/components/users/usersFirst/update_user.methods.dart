import 'package:dio/dio.dart';
import 'package:found_legacy/models/user_audit.model.dart';
import 'package:found_legacy/models/user_documents.model.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';
import 'package:found_legacy/user_app/app/common/Util.dart';

class UpdateUserMethods {
  static Future<UserDocuments> getUserDocuments(String id) async {
    final apiCall = RestClient(DioClient.getDio());

    return apiCall.getUserDocuments(id).then((data) {
      return data;
    }).catchError((err) {
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }


  static Future<UserAuditLogs> getUserAuditLogs(String id) async{
    final apiCall=RestClient(DioClient.getDio());


  return  apiCall.getUserAuditLogs(id).then((data){
      return data;
    }).catchError((err){
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }

}
