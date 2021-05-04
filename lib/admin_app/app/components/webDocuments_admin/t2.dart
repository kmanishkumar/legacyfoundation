//import 'package:async_loader/async_loader.dart';
//import 'package:flutter/material.dart';
//import 'package:found_legacy/services/api_services.dart';
//
////void main() {
////  runApp( MaterialApp(
////    debugShowCheckedModeBanner: false,
////    theme:  ThemeData(
////      primaryColor: const Color(0xFF02BB9F),
////      primaryColorDark: const Color(0xFF167F67),
////      accentColor: const Color(0xFF167F67),
////    ),
////    home:  DropdownScreen(),
////  ));
////}
//class Item {
//  const Item(this.name, this.icon);
//  final String name;
//  final Icon icon;
//}
//
//class DropdownScreen extends StatefulWidget {
//  State createState() => DropdownScreenState();
//}
//
//class DropdownScreenState extends State<DropdownScreen> {
//  ApiService _apiService = ApiService();
//
//  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
//      new GlobalKey<AsyncLoaderState>();
//
//  Item selectedUser;
//  List<Item> users = <Item>[
//    const Item(
//        'Android',
//        Icon(
//          Icons.android,
//          color: const Color(0xFF167F67),
//        )),
//    const Item(
//        'Flutter',
//        Icon(
//          Icons.flag,
//          color: const Color(0xFF167F67),
//        )),
//    const Item(
//        'ReactNative',
//        Icon(
//          Icons.format_indent_decrease,
//          color: const Color(0xFF167F67),
//        )),
//    const Item(
//        'iOS',
//        Icon(
//          Icons.mobile_screen_share,
//          color: const Color(0xFF167F67),
//        )),
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          backgroundColor: const Color(0xFF167F67),
//          title: Text(
//            'Dropdown options',
//            style: TextStyle(color: Colors.white),
//          ),
//        ),
//        body: Expanded(
//          child: AsyncLoader(
//            key: _asyncLoaderState,
//            initState: () async => _apiService.getUserList(),
//            renderLoad: () => Align(
//              alignment: Alignment.center,
//              child: SizedBox(
//                width: 50,
//                height: 50,
//                child: CircularProgressIndicator(),
//              ),
//            ),
//            renderError: ([err]) => Text('Has Error'),
//            renderSuccess: ({data}) => ,
//          ),
//        ),
//      ),
//    );
//  }
//}
