import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:pms/userpages/userstart.dart';
import 'constants.dart';

void main() => runApp(Starting());

class Starting extends StatefulWidget {
  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        accentColor: accentColor,
      ),
      home: Scaffold(
        body: UserStartPage(),
      ),
    );
  }
}
