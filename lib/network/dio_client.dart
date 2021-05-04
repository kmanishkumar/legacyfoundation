import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient{


  static getDio(){

    final dio=Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    // TODO: Remove while publishing
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options option) async {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      option.headers = {"Authorization": token};
    }));
    return dio;
  }
}