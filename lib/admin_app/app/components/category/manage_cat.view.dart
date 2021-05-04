import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/category/manage_cat.bloc.dart';
import 'package:found_legacy/admin_app/app/components/category/manage_cat.methods.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AdminManageCat extends StatefulWidget {
  @override
  _AdminManageCatState createState() => _AdminManageCatState();
}

class _AdminManageCatState extends State<AdminManageCat> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<AsyncLoaderState> _asyncLoaderState =
    new GlobalKey<AsyncLoaderState>();

    final manageCatBloc=Provider.of<ManageCatBloc>(context,listen: false);



    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            elevation: 0,
            heroTag: 'back',
            backgroundColor: Colors.white,
            onPressed: ()=>Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){
              ManageCatMethods.showCreateCat(context,manageCatBloc);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Create Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              ),
            ),
          ),
        ],
        title: Text("Manage Category",
            style: Theme.of(context).textTheme.headline),
      ),
      backgroundColor: Colors.white,
      body: AsyncLoader(
        initState: () async=>ManageCatMethods.getAllCat(manageCatBloc),
        renderLoad: ()=>Center(child: RefreshProgressIndicator(backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation(Colors.black),),),
        renderError: ([err])=>Text('Error while getting category'),
        renderSuccess: ({data})=>SmartRefresher(
          controller: manageCatBloc.refreshController,
          onRefresh: (){
            ManageCatMethods.getAllCat(manageCatBloc);
          },
          header: WaterDropMaterialHeader(backgroundColor: Colors.blueGrey,),
          child: ManageCatMethods.generateCatList(context, manageCatBloc),

        )
      ),

    );
  }


}
