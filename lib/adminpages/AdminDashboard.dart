import 'package:flutter/material.dart';
import 'package:pms/adminpages/drawers.dart';
class AdminDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      drawer: Drawers(),
      body: Text('Admin'),
    );
  }
}
