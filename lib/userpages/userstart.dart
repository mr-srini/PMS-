import 'package:flutter/material.dart';
import 'package:pms/constants.dart';

class UserStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton
            onPressed: (){
            },
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    buttonColor,
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("images/logainpage.jpg"),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              print("checkin");
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: buttonColor),
              child: Text(
                "Check in",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: fontSize,
                    letterSpacing: letterspacing),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              print("checkout");
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 92),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: buttonColor),
              child: Text(
                "Check out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 20.0,
                    letterSpacing: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
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
