import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ComponentsAndConstants/constants.dart';
import 'ComponentsAndConstants/flags.dart';
import 'ComponentsAndConstants/textfield.dart';
import 'userstart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'ModelClasses/UserMasterMO.dart';
import 'adminpages/AdminDashboard.dart';

var users = new List<UserMasterMO>();
String nameDisp = '  ';
var username = '', password = '';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController uc = TextEditingController();
  TextEditingController pc = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void clear() {
    uc.clear();
    pc.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> signIn(String username, String password) async {
      if (username == 'admin' && password == 'admin123') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => AdminDashboard()),
            (Route<dynamic> route) => true);
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        Map data = {'user_name': username, 'user_pass': password};
        var response = await http.post(
            'http://192.168.43.252/www/PHP/UserMasterTable.php',
            body: data);
        try {
          if (response.statusCode == 200) {
            isConnected = true;
            sharedPreferences.setBool('isloggedIn', true);
            var userJson = json.decode(response.body);
//             print(userJson);
            for (var user in userJson) {
              users.insert(0, UserMasterMO.fromJson(user));
            }
//               sharedPreferences.setString("token",userJson["token"] );
            nameDisp = users[0].userName.toString();
            if (users.length == 1) {
//                 print("Connected");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => UserStartPage()),
                  (Route<dynamic> route) => false);
            } else {
              print("Wrong In");
            }
          } else {
            print("Wrong ");
          }
        } catch (Exception) {}
      }
    }

    uc.addListener(() {
      username = uc.text;
    });
    pc.addListener(() {
      password = pc.text;
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Expanded(
          flex: 1,
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
                  setState(() {
                    if (username == 'admin' && password == 'admin') {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AdminDashboard()));
                    } else {
                      signIn(username, password);
                    }
                  });
                  clear();
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
