import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:found_legacy/admin_app/app/common/util.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/components/webDocs/docs_list.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';


import 'getDocs_user.dart';

class UserWebView extends StatelessWidget {
  final responseData;
  static LoginProvider provider;
  ApiService _apiService = ApiService();
  UserWebView({
    this.responseData,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: false);

    var token = provider.token;
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    var documentId = this.responseData.documentId;
    return AsyncLoader(
      initState: () async => _apiService.authorizeUser(),
      renderLoad: () => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      renderError: ([err]) => Text('Something went wrong'),
      renderSuccess: ({data}) => _generateBody(context,data, documentId,token),
    );
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
  }

  _generateBody(BuildContext context, data, documentId,token) {
    var host = DotEnv().env['DOCSIGN'];
    var userAccessToken = data['docToken'];
    var url =  "$host/document/$documentId/duplicate?returntoken=$token&useraccesstoken=$userAccessToken";
    print(url);
    if (documentId == null) {
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("Document Data in Null"),
        ),
      );
    } else {
      return Scaffold(
//        supportMultipleWindows: false,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () {
                Navigator.pop(context);
              } ),
          title: Text("Legacy", style: Theme.of(context).textTheme.display1),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
          body: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            // javascriptMode: o,
          ),
//        hidden: true,
// //        enableAppScheme: true,
//         url: url,
//         withLocalStorage: true,
//         initialChild: Container(
//           color: Colors.white,
//           child: const Center(
//             child:  CircularProgressIndicator(),
//           ),
//         ),
// //        withZoom: true,
//         withJavascript: true,
//         withOverviewMode: true,
// //        scrollBar: true,
//         useWideViewPort: true,
//        resizeToAvoidBottomInset: true,
      );

    }
  }
}
