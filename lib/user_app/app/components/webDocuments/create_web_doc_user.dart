import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getAccountDetails_model.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:provider/provider.dart';

class UserCreateDoc extends StatefulWidget {
  var data;

  UserCreateDoc({this.data});

  @override
  _UserCreateDocState createState() => _UserCreateDocState();
}

class _UserCreateDocState extends State<UserCreateDoc> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  void initState() {
    super.initState();
  }

  String fromEmail;

  void didInitState() async {
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    var token = provider.token;
    var toEmail = widget.data;

    return AsyncLoader(
      initState: () async => await _apiService.authorizeUser(),
      renderLoad: () => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      renderError: ([err]) => Text('Something went wrong'),
      renderSuccess: ({data}) => _generateBody(data, toEmail, token),
    );
  }

  _generateBody(userData, String toEmail, String token) async{
    var userAccessToken = userData.userAccessToken;


    return WebviewScaffold(
      supportMultipleWindows: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("Legacy", style: Theme.of(context).textTheme.display4),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      hidden: true,
      enableAppScheme: true,
      url:
          'http://192.168.0.11:4200/upload?to=$toEmail&returntoken=$token&useraccesstoken=$userAccessToken',
      withLocalStorage: true,
      debuggingEnabled: true,
      withZoom: false,
      withJavascript: true,
      withOverviewMode: true,
      scrollBar: true,
      useWideViewPort: false,
      resizeToAvoidBottomInset: true,
    );
  }
}
