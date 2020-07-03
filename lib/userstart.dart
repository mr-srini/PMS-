import 'package:flutter/material.dart';
import 'package:pms/ComponentsAndConstants//clipper.dart';
import 'package:pms/ComponentsAndConstants//constants.dart';
import 'package:pms/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserPages2.0/checkin.dart';
import 'UserPages2.0/checkout.dart';

class UserStartPage extends StatefulWidget {
  @override
  _UserStartPageState createState() => _UserStartPageState();
}

class _UserStartPageState extends State<UserStartPage> {
  @override
  Future<void> dispose() async {
    super.dispose();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    users.clear();
  }

  @override
  Widget build(BuildContext context) {
    logoutUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      users.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }

    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to Logout?'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => logoutUser(),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          backgroundColor: Color(0xFF3383CD),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                logoutUser();
              },
              child: Icon(Icons.power_settings_new),
            )
          ],
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  child: Container(
                    alignment: AlignmentDirectional.center,
//                  child: FadeAnimatedTextKit(
//                    onTap: () {},
////                    ${}
//                    text: ["Hello,${nameDisp}", "Have a good day."],
//                    textStyle: TextStyle(
//                        fontSize: 70.0,
//                        fontWeight: FontWeight.bold,
//                        color: ktextColor),
//                  ),
                    child: Text(nameDisp.toString()),
                  ),
                  padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        kbuttonColor,
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => nCheckin(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kbuttonColor,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        kbuttonColor,
                      ],
                    ),
                  ),
                  child: Text(
                    "Check in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: kfontSize,
                        letterSpacing: kletterspacing),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => nCheckout(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 92),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kbuttonColor,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        kbuttonColor,
                      ],
                    ),
                  ),
                  child: Text(
                    "Check out",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ktextColor,
                        fontSize: 20.0,
                        letterSpacing: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}