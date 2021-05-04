import 'package:after_init/after_init.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/admin_app/app/services/admin_model/getAccountDetails_model.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'getDocs_admin.dart';

class WebViewLoaderCreate extends StatefulWidget {
  var data;

  WebViewLoaderCreate({this.data});

  @override
  _WebViewLoaderCreateState createState() => _WebViewLoaderCreateState();
}

class _WebViewLoaderCreateState extends State<WebViewLoaderCreate>
    with AfterInitMixin {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  String fromEmail;

  @override
  void initState() {
    super.initState();
  }

  void didInitState() async {
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context,listen: false);

    var token = provider.token;
    return AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => _apiService.authorizeUser(),
      renderLoad: () => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      renderError: ([err]) => Text('Something went wrong'),
      renderSuccess: ({data}) => _generateBody(data, widget.data, token),
    );
  }

  _generateBody(data, String attributes, String token) {
    var userAccessToken = data['docToken'];
    var host = DotEnv().env['DOCSIGN'];
    print(userAccessToken);
    var url =  '$host/upload?attributes=$attributes&returntoken=$token&useraccesstoken=$userAccessToken';
    print('==>> $url');
    url = Uri.encodeFull(url);
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
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WebDocuments() ) );
            } ),
        title: Text("Legacy", style: Theme.of(context).textTheme.display1),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[],
      ),
      url :url,
//      displayZoomControls: true,
      withLocalStorage: true,
//      useWideViewPort: true,
//      withOverviewMode: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child:  CircularProgressIndicator(),
        ),
      ),
    );
  }
}
//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//class WebViewLoaderCreate extends StatefulWidget {
//  final url;
//  WebViewLoaderCreate(this.url);
//  @override
//  createState() => _WebViewLoaderCreateState(this.url);
//}
//class _WebViewLoaderCreateState extends State<WebViewLoaderCreate> {
//  var _url;
//  final _key = UniqueKey();
//  _WebViewLoaderCreateState(this._url);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//        centerTitle: true,
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back_ios,
//              color: Colors.black,
//              size: 22,
//            ),
//            onPressed: () => Navigator.of(context).pop()),
//        title: Text("Legacy", style: Theme.of(context).textTheme.display1),
//        elevation: 0,
//        backgroundColor: Colors.white,
//        actions: <Widget>[],
//      ),
//        body: Column(
//          children: [
//            Expanded(
//                child: WebView(
//                    key: _key,
//                    javascriptMode: JavascriptMode.unrestricted,
//                    initialUrl: _url))
//          ],
//        ));
//  }
//}