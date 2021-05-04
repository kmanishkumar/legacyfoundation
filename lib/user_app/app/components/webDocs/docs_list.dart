import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/providers/login-provider.dart';
import 'package:found_legacy/services/api_services.dart';
import 'package:found_legacy/user_app/app/components/common-components/Component.dart';
import 'package:found_legacy/user_app/app/components/webDocs/get_docs_by_cat.methods.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/webView_user.dart';
import 'package:provider/provider.dart';
//import 'package:legacy_foundations/app/components/common-components/Component.dart';

class DocsOfCategory extends StatefulWidget {
  String name, id;

  DocsOfCategory({Key key, @required this.name, @required this.id})
      : super(key: key);

  @override
  _DocsOfCategoryState createState() => _DocsOfCategoryState();
}

class _DocsOfCategoryState extends State<DocsOfCategory> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    final _height = MediaQuery.of(context).size.height;

    final blockSize = _width / 100;

    final blockSizeVertical = _height / 100;
    var provider = Provider.of<LoginProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
//            onPressed: () => Navigator.of(context).pop()
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.name, style: Theme.of(context).textTheme.headline),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[],
        ),
        body: Center(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Opacity(
                    //     opacity: 0.8,
                    //     child: Image.asset(
                    //       "images/" + widget.id + ".jpg",
                    //       fit: BoxFit.fill,
                    //     )),
                    AsyncLoader(
                      key: _asyncLoaderState,
//          initState: () async => await _apiService.getDocuments(),
                      initState: () async =>
                          await GetDocsByMethods.getDocsByCAt(widget.id),
                      renderLoad: () => Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      renderError: ([err]) =>
                          Center(child: Text(' No Documents')),
                      renderSuccess: ({data}) =>
                          webDocumentsView(data, provider),
                    )
                  ],
                )))));
  }

  webDocumentsView(data, provider) {
    if (data == null) {
      return Container();
    } else if (data.documents == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.documents;

      return Container(
//        color: Colors.green,
        child: RefreshIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          onRefresh: () => _asyncLoaderState.currentState.reloadState(),
          child: ListView.builder(
            itemCount: values.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserWebView(
                              responseData: values[index],
                            )));
              },
              child: Container(
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              values[index].name,
//                                "Document  ${index + 1}",
                              style: Theme.of(context).textTheme.display3,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 17),
                      )
                    ],
                  )
                ],
              )),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
            ),
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 15),
      );
    }
  }
}
