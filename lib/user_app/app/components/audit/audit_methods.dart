

import 'package:dio/dio.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/network/api.network.dart';
import 'package:found_legacy/network/dio_client.dart';
import 'package:logger/logger.dart';

class AuditMethods {
  static getUserAuditLogs() async {
    final id = await AdminUtil.sharePrefsUserId();

    final apiCall = RestClient(DioClient.getDio());

    return apiCall.getUserAuditLogs(id).then((data) {
      return data;
    }).catchError((err) {
      final error = (err as DioError).response;
      throw Exception(error);
    });
  }
}
