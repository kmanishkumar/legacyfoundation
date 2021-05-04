import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/services/api_services.dart';

class AlertBox extends StatefulWidget {
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  ApiService _apiService = ApiService();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Show Dialog'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  _showDialog(context);
                },
                child: new Icon(
                  Icons.slideshow,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }

  // Show Dialog function
  void _showDialog(context) {
//     Container(
//      color: Colors.yellow,
//      child: AsyncLoader(
//        key: _asyncLoaderState,
//        initState: () async => _apiService.getUserList(),
//        renderLoad: () => Align(
//          alignment: Alignment.center,
//          child: SizedBox(
//            width: 50,
//            height: 50,
//            child: CircularProgressIndicator(),
//          ),
//        ),
//        renderError: ([err]) => Text('Has Error'),
//        renderSuccess: ({data}) => userListView(context, data),
//      ),
//    );

    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text('I am Title'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.yellow,
                child: AsyncLoader(
                  key: _asyncLoaderState,
                  initState: () async => _apiService.getUserList(),
                  renderLoad: () => Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  renderError: ([err]) => Text('Has Error'),
                  renderSuccess: ({data}) => userListView(context, data),
                ),
              ),
            ),
          ],

//            content: userListView(data)
          content: userListView(context, data),
        );
      },
    );
  }

  Widget userListView(context, data) {
    var values = data;
    print(values);

    if (data == null) {
      return Container();
    } else if (data.user == null) {
      return Container(
        child: Center(
          child: Text(
              "Unable to retrive Document Information\nNo document found :(",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2),
        ),
      );
    } else {
      var values = data.user;

      return ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, int index) => Column(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              values[index].info.email,
                              style: Theme.of(context).textTheme.display3,
//                                    textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
    }
  }
}

//          Container(
//            height: 150.0,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                new Row(
//                  children: <Widget>[
//                    new Icon(Icons.toys),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 8.0),
//                      child: new Text(' First Item'),
//                    ),
//                  ],
//                ),
//                new SizedBox(
//                  height: 20.0,
//                ),
//                new Row(
//                  children: <Widget>[
//                    new Icon(Icons.toys),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 8.0),
//                      child: new Text(' Second Item'),
//                    ),
//                  ],
//                ),
//                new SizedBox(
//                  height: 20.0,
//                ),
//                new Row(
//                  children: <Widget>[
//                    new Icon(Icons.toys),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 8.0),
//                      child: new Text('Third Item'),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ),

//
//return Container(
//color: Colors.blue,
//child: ListView.builder(
//itemCount: values.length,
//itemBuilder: (context, int index) => Column(
//children: <Widget>[
//Container(
//color: Colors.green,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Container(
//child: Align(
//alignment: Alignment.center,
//child: Text(
//values[index].info.email,
//style: Theme.of(context).textTheme.display3,
////                                    textAlign: TextAlign.start,
//),
//),
//),
//],
//),
//)
//],
//)),
//);
