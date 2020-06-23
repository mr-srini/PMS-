import 'package:flutter/material.dart';
import 'package:pms/constants.dart';

class UserStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton
            onPressed: (){

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
