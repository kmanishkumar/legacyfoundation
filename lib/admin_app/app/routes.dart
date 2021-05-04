import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/audit_logs/audit_history.dart';
import 'package:found_legacy/admin_app/app/components/documents/create_document.dart';

import 'package:found_legacy/admin_app/app/components/roles/manage_roles.dart';

import 'package:found_legacy/admin_app/app/components/dashboard/dashboard.dart';
import 'package:found_legacy/admin_app/app/components/roles/roles_list.dart';
import 'package:found_legacy/admin_app/app/components/roles/roles_switch.dart';

import 'package:found_legacy/admin_app/app/components/users/audit_log.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/create_user.dart';
import 'package:found_legacy/admin_app/app/components/users/user_details.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/update_user.dart';
import 'package:found_legacy/admin_app/app/components/users/users_docs.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/admin_app/app/components/users/view_documents.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/getDocs_admin.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/t2.dart';
import 'package:found_legacy/admin_app/app/components/webDocuments_admin/trail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return new CustomRoute(
//          builder: (_)=> UpdateUser(),
//        builder: (_)=>RolesListScreen(),
//          builder: (_) => RolesSwitch(),

          //          builder: (_) => ManageRoles(),
          builder: (_) => Dashboard(),
//          builder: (_) => AuditHistoryAdmin(),
//
//            builder: (_)=>WebDocuments(),

//        builder: (_)=> CreateDoc(),

//            builder:(_)=>DropdownScreen(),
//          builder: (_)=>DropdownMenu(),
//          builder: (_) => UsersListScreen(),
//          builder: (_) => AlertBox(),
          settings: settings,
        );

      case '/dashBoard':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => Dashboard(),
          settings: settings,
        );

      case '/roles':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => RolesSwitch(),
          settings: settings,
        );

      case '/rolesList':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => RolesListScreen(),
          settings: settings,
        );

      case '/userDetails':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => UserDetails(),
          settings: settings,
        );

      case '/userDoc':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => UsersDoc(),
          settings: settings,
        );

      case '/createUser':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => CreateUser(),
          settings: settings,
        );

      case '/editUser':
        // Validation of correct data type
        return new CustomRoute(
//          builder: (_) => EditUser(),
          builder: (_) => UpdateUser(),
          settings: settings,
        );

      case '/userList':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => UsersListScreen(),
          settings: settings,
        );

      case '/createDoc':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => CreateDoc(),
          settings: settings,
        );

      case '/viewDoc':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => ViewDocuments(),
          settings: settings,
        );

      case '/auditLog':
        // Validation of correct data type
        return new CustomRoute(
          builder: (_) => AuditLog(),
          settings: settings,
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
