import 'package:flutter/material.dart';
import 'package:pms/clipper.dart';
import 'package:pms/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pms/userpages/check_in.dart';
import 'package:pms/userpages/check_out.dart';

class UserStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: FadeAnimatedTextKit(
                    onTap: () {},
                    text: ["Hello, Akhilesh", "Have a good day."],
                    textStyle: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        color: ktextColor),
                  ),
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
                    builder: (context) => Checkin(),
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
                    builder: (context) => Checkout(),
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
    );
  }
}
