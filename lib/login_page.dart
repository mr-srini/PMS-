import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/constants.dart';
import 'package:pms/textfield.dart';
import 'package:pms/userpages/userstart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'adminpages/AdminDashboard.dart';

var username = '', password = '';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController uc = TextEditingController();
  TextEditingController pc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    uc.addListener(() {
      username = uc.text;
    });
    pc.addListener(() {
      password = pc.text;
    });
    return SafeArea(
      child: Expanded(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyLoginClipper(),
              child: Container(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: RotateAnimatedTextKit(
                    onTap: () {},
                    text: ["Parking", "Management System"],
                    textStyle: TextStyle(
                        fontSize: 50.0,
                        color: ktextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 400,
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
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              controller: uc,
              placeholder: "Username",
              prefixIcon: Icon(Icons.supervised_user_circle),
              onSubmitted: (text) {
                password = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              maxLines: 1,
              obscureText: true,
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              controller: pc,
              placeholder: "Password",
              prefixIcon: Icon(Icons.lock_outline),
              onSubmitted: (text) {
                password = text;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
// ignore: missing_return
                setState(() {
//DATABASE VALADITING
                  if (username == 'Srini' && password == '123') {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => AdminDashboard(),
                      ),
                    );
                  } else if (username == 'Akhil' && password == '123') {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => UserStartPage(),
                      ),
                    );
                  } else
                    return Alert(
                            buttons: [],
                            context: context,
                            type: AlertType.error,
                            title: "Invalid username and password")
                        .show();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kbuttonColor,
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      kbuttonColor,
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyLoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
