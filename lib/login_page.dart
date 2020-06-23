import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/adminpages/AdminDashboard.dart';
import 'textfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xff5c5bb0),
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "PMS",
                style: TextStyle(color: Colors.white),
              ),
              background: Image(
                image: AssetImage("images/loginpage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
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
                           Alert(
                            style: AlertStyle(
                              animationDuration: Duration(milliseconds: 250),
                            ),
                            context: context,
                            type: AlertType.success,
                            title: "Sucess",
                            desc: "Admin Logged in",
                            buttons: [],
                          ).show();
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>AdminDashboard()));
                        } else
                          return Alert(
                            style: AlertStyle(
                              animationDuration: Duration(milliseconds: 250),
                            ),
                            context: context,
                            type: AlertType.error,
                            title: "Invalid username or password",
                            desc: "Enter a valid username or password",
                            buttons: [],
                          ).show();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff5c5bb0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 75),
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
        ],
      ),
    );
  }
}
