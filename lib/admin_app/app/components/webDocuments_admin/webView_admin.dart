import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:provider/provider.dart';

class WebViewLoader extends StatelessWidget {
  final responseData;

  static LoginProvider provider;
  WebViewLoader({this.responseData});

  @override
  Widget build(BuildContext context) {
    var document = this.responseData;
    var documentId = this.responseData.documentId;
    return AsyncLoader(
      initState: () async => await AdminUtil.sharePrefsEmail(),
      renderLoad: () => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      renderError: ([err]) => Align(
          alignment: Alignment.center, child: Text('Something went wrong')),
      renderSuccess: ({data}) =>
          _generateBody(context, data, documentId, document),
    );
  }

  _generateBody(context, data, var documentId, var document) {
    print(documentId);
    var host = DotEnv().env['DOCSIGN'];
  var url =  "$host/document/$documentId/patch";
  print(url);
    if (document == null) {
      return Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("Document Data in Null"),
        ),
      );
    } else {
      return WebviewScaffold(
//        supportMultipleWindows: false,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () => Navigator.of(context).pop()),
          title: Text("Legacy", style: Theme.of(context).textTheme.display1),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
        hidden: true,
        initialChild: Container(
          color: Colors.white,
          child: const Center(
            child:  CircularProgressIndicator(),
          ),
        ),
        url: url,
        withLocalStorage: true,
//        debuggingEnabled: true,
//        withZoom: true,
        withJavascript: true,
        withOverviewMode: true,
//        scrollBar: true,
        useWideViewPort: true,
      );
    }
  }
}
