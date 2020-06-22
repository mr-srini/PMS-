import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'textfield.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          BeautyTextfield(
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
                //DATABASE VALADITING
                if (username == 'Srini' && password == '123') {
                  print('Sucess');
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff5c5bb0),
                borderRadius: BorderRadius.circular(50),
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
            //color: Color(0xff1376ff),
            //padding: EdgeInsets.only(left: 75, right: 75),
          ),
        ],
      ),
    );
  }
}
