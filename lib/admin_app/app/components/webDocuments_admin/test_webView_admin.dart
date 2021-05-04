//import 'package:async_loader/async_loader.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:found_legacy/admin_app/app/common/util.dart';
//import 'package:found_legacy/providers/login-provider.dart';
//import 'package:provider/provider.dart';
//
//class WebViewLoaderState extends StatefulWidget {
//  final responseData;
//
//  static LoginProvider provider;
//  WebViewLoaderState({this.responseData});
//
//  @override
//  _WebViewLoaderStateState createState() => _WebViewLoaderStateState();
//}
//
//class _WebViewLoaderStateState extends State<WebViewLoaderState> {
//  @override
//  Widget build(BuildContext context) {
//    var document = widget.responseData;
//    var documentId = widget.responseData.documentId;
//    return AsyncLoader(
//      initState: () async => await AdminUtil.sharePrefsEmail(),
//      renderLoad: () => Align(
//        alignment: Alignment.center,
//        child: CircularProgressIndicator(),
//      ),
//      renderError: ([err]) => Align(
//          alignment: Alignment.center, child: Text('Something went wrong')),
//      renderSuccess: ({data}) =>
//          _generateBody(context, data, documentId, document),
//    );
//  }
//
//  _generateBody(context, data, var documentId, var document) {
//    return WebviewScaffold(
//      supportMultipleWindows: false,
//      appBar: AppBar(
//        centerTitle: true,
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back_ios,
//              color: Colors.black,
//              size: 22,
//            ),
//            onPressed: () => Navigator.of(context).pop()),
//        title: Text("Legacy", style: Theme.of(context).textTheme.display4),
//        elevation: 0,
//        backgroundColor: Colors.white,
//        actions: <Widget>[],
//      ),
//      hidden: true,
//      enableAppScheme: true,
//      url: document.to == data
//          ? "http://167.172.224.130/view-document/$documentId"
//          : "http://167.172.224.130/view-document/$documentId/read",
//      withLocalStorage: true,
//      debuggingEnabled: true,
//      withZoom: true,
//      withJavascript: true,
//      withOverviewMode: true,
//      scrollBar: true,
//      useWideViewPort: false,
//      resizeToAvoidBottomInset: true,
//    );
//  }
//}
