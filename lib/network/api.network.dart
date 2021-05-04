import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/cat_created.model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/category_model.model.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/delete_user.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/message.model.dart';
import 'package:found_legacy/models/get_all_cat.model.dart';
import 'package:found_legacy/models/get_all_users.dart';
import 'package:found_legacy/models/get_doc_by_cat.model.dart';
import 'package:found_legacy/models/sendMailModel.dart';
import 'package:found_legacy/models/user_audit.model.dart';
import 'package:found_legacy/models/user_documents.model.dart';
import 'package:retrofit/retrofit.dart';

import '../globals.dart';
part 'api.network.g.dart';
const String authorization = "Authorization";
//@RestApi(baseUrl: "http:///192.168.0.35:3000/v0/")
@RestApi(baseUrl: APIURL)
abstract class RestClient{


  factory RestClient(Dio dio) = _RestClient;


  @GET('/categories')
  Future<CategoryModel> getAllCategory();


  @POST('/create-category')
  Future<CatCreatedModel> createCat(@Body() body);

  @DELETE("/delete-category/{id}")
  Future<MessageModel> deleteCat(@Path() String id);

  @DELETE("/delete-role/{id}")
  Future<DeleteUserModel> deleteRole( @Header(authorization) auth,@Path() String id);

  @PUT('/update-category/{id}')
  Future<void> updateCat(@Body() body);


  @GET('/categories')
  Future<GetAllCat> getAllCat();

  @GET('/document-category/{id}')
  Future<GetDocsByCat> getDocsByCat(@Path() String id);


  @GET('/users')
  Future<GetAllUsers> getAllUsers();

  @GET('/documents')
  Future<UserDocuments> getUserDocuments(@Query('userId') String userId);

  @GET('/auditlog/{id}')
  Future<UserAuditLogs> getUserAuditLogs(@Path() String id);

  // @POST('/send-note-in-email')
  // Future<SendMailModel> sendMail(@Header(authorization) auth,@Body() body);
  //













}