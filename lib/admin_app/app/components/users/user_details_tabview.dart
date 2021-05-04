import 'package:flutter/material.dart';
import 'package:found_legacy/admin_app/app/components/users/audit_log.dart';
import 'package:found_legacy/admin_app/app/components/users/usersFirst/users_list.dart';
import 'package:found_legacy/admin_app/app/components/users/view_documents.dart';



class UserDetailsTabView extends StatefulWidget {
  @override
  _UserDetailsTabViewState createState() => _UserDetailsTabViewState();
}

class _UserDetailsTabViewState extends State<UserDetailsTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom:
        TabBar(
          tabs: [
            Tab(
              text: "View Documents",
            ),
            Tab(
              text: "View Audit Log",
            ),
          ],
          labelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: <Widget>[ViewDocuments(),
          AuditLog()
//        UsersListScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}
