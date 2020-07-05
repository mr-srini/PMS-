import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pms/ComponentsAndConstants/flags.dart';
import 'package:pms/login_page.dart';
import 'userstart.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool status = false;

//String token = '';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.green,
//        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage("assets/images/clinician_splash.png"),
//              fit: BoxFit.cover),
//        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 2), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getBool('isloggedIn');
    try {
      if (status == true && isConnected == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => UserStartPage()),
            (Route<dynamic> route) => false);
      }
      if (status == null || status == false || isConnected == false) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    } catch (Exception) {}
  }
}
