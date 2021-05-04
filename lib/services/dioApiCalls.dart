import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
//  static final String baseUrl = "http://167.172.224.130:3000/v0/";

  static final String baseUrl = DotEnv().env['APIURL'];

//  static final String baseUrl = "http://192.168.0.176:3000/v0/";

  var dio = Dio();
  String token;

  getAllSharedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    this.token = await preferences.getString("token");
  }

  Future<dynamic> dioSetup() async {
    this.getAllSharedData();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options option) async {
      option.headers = {"Authorization": token};
    }));
  }

  Future<Response> getAllRoles() async {
    await dioSetup();
    try {
      Response response = await dio.get(baseUrl + "roles/user");
      return response;
    } on DioError catch (e) {
      catchErrorOnDio(e);
    }
  }

  catchErrorOnDio(e) {
    print(e);
    throw Exception(e);
  }
}
