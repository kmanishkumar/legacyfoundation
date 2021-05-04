import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/category_model.model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManageCatBloc extends ChangeNotifier{


  CategoryModel _categoryModel=CategoryModel();



  RefreshController _refreshController=RefreshController(initialRefresh: false);
  RefreshController get refreshController=>_refreshController;

  CategoryModel get categoryModel=>_categoryModel;


  set setCatModel(CategoryModel categoryModel){
    _categoryModel=categoryModel;
    notifyListeners();
  }




}