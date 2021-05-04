import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_legacy/user_app/app/components/audit/auditLogHistory.dart';
import 'package:found_legacy/user_app/app/components/audit/auditLog_user.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_history.dart';
import 'package:found_legacy/user_app/app/components/audit/audit_note_history0.dart';

import 'package:found_legacy/user_app/app/components/dashboard/cat/categoryList.dart';

import 'package:found_legacy/user_app/app/components/note/create_note.dart';
import 'package:found_legacy/user_app/app/components/webDocs/docs_list.dart';
import 'package:found_legacy/user_app/app/components/webDocuments/getDocs_user.dart';

class BottomNavBar extends StatefulWidget {

  int index=0;
  BottomNavBar(this.index);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
print(widget.index);
    setState(() {
      _tabController =
          new TabController(length: 3, vsync: this, initialIndex: widget.index ?? 0);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [CatList(), CreateNote(), AuditLogNotes()],
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          isScrollable: false,
          indicatorColor: Colors.white,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.edit),
            ),
            Tab(
              icon: Icon(Icons.history),
            )
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
