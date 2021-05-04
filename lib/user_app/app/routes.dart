import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_log_note2.dart';
import 'package:found_legacy/user_app/app/components/dashboard/cat/categoryList.dart';

import 'package:found_legacy/user_app/app/components/dashboard/bottom_nav_bar.dart';

import 'package:found_legacy/user_app/app/components/note/create_note.dart';
import 'package:found_legacy/user_app/app/components/note/edit_note.dart';
import 'package:found_legacy/user_app/app/components/note/getNotesById.dart';

import 'components/audit/auditLogHistory.dart';
import 'components/documentList.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':

        return new CustomRoute(
//          builder: (_)=>WebDocumentsUser(),

          builder: (_) => BottomNavBar(0),
//        builder: (_)=>GetNotesById(),
//       builder: (_) => CreateNote(),
          settings: settings,
        );

      case '/intro':
        // Validation of correct data type
        return new CustomRoute(

          builder: (_) => BottomNavBar(0),
        );

      case '/editNote':
        return new CustomRoute(
          builder: (_) => EditNote(),
        );

      case '/auditLog':
        return new CustomRoute(
          builder: (_) => AuditLog(),
          settings: settings,
        );

      case '/auditNote':
        return new CustomRoute(
          builder: (_) => AuditNote(),
          settings: settings,
        );

      case '/createNote':
        return new CustomRoute(
            builder: (_) => CreateNote(), settings: settings);

      case '/docList':
        return new CustomRoute(
          builder: (_) => DocList(),
        );

      case '/catList':
        return new CustomRoute(
          builder: (_) => CatList(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
