import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/constants.dart';
import 'package:pms/flags.dart';
import 'package:pms/textfield.dart';
import 'package:pms/userpages/check_out.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../clipper.dart';

class Checkin extends StatefulWidget {
  @override
  _CheckinState createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  String alternatenumber, rfid, vehiclenumber, helmet;
  var selecteditem;
  int keepindex;
  var tabs = [Checkin(), Checkout()];

  var _vtype = ["Bike", "Car", "Bus"];

  TextEditingController cAlternate = TextEditingController();
  TextEditingController cRfid = TextEditingController();
  TextEditingController cVehiclenumber = TextEditingController();
  TextEditingController chelmet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cAlternate.addListener(() {
      alternatenumber = cAlternate.text;
    });
    cRfid.addListener(() {
      rfid = cRfid.text;
    });
    cVehiclenumber.addListener(() {
      vehiclenumber = cVehiclenumber.text;
    });
    chelmet.addListener(() {
      helmet = chelmet.text;
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipPath(
              clipper: MyCheckinClipper(),
              child: Container(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: TyperAnimatedTextKit(
                    onTap: () {},
                    text: ["You can check in here."],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: ktextColor),
                  ),
                ),
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                height: 175,
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
            Visibility(
              visible: rfidflag,
              child: Center(
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 75,
                  inputType: TextInputType.text,
                  controller: cRfid,
                  placeholder: "RFID number",
                  prefixIcon: Icon(Icons.rss_feed),
                  onSubmitted: (text) {
                    rfid = text;
                  },
                  onTap: () {},
                ),
              ),
            ),
            Center(
              child: BeautyTextfield(
                cornerRadius: BorderRadius.circular(50),
                width: 400,
                height: 75,
                inputType: TextInputType.text,
                controller: cAlternate,
                placeholder: "Alternate number",
                prefixIcon: Icon(Icons.autorenew),
                onSubmitted: (text) {
                  alternatenumber = text;
                },
              ),
            ),
            Center(
              child: BeautyTextfield(
                cornerRadius: BorderRadius.circular(50),
                width: 400,
                height: 75,
                inputType: TextInputType.text,
                controller: cVehiclenumber,
                placeholder: "Vehicle number",
                prefixIcon: Icon(Icons.input),
                onSubmitted: (text) {
                  vehiclenumber = text;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: ktextfieldheight,
                width: ktextfieldwidth,
                decoration: BoxDecoration(
                    color: Color(0xff818181),
                    borderRadius: BorderRadius.circular(kbroderRadius)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          "Select vehicle type",
                          style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.white,
                        ),
                        underline: Container(),
                        items: _vtype.map((String dropdownitem) {
                          return DropdownMenuItem<String>(
                            value: dropdownitem,
                            child: Text(
                              dropdownitem,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 25.0,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            this.selecteditem = value;
                            if (defaultEnabled) {
                              keepindex = _vtype.indexOf(selecteditem);
                              _vtype.removeRange(0, _vtype.length);
                              _vtype.add(selecteditem);
                            }

                            if (selecteditem == 'Bike') {
                              bikeSelectedFlag = true;
                            } else
                              bikeSelectedFlag = false;
                            //print(selecteditem.toString());
                          });
                        },
                        value: selecteditem,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: bikeSelectedFlag && helmetflag,
              child: Center(
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 75,
                  inputType: TextInputType.text,
                  controller: chelmet,
                  placeholder: "Number of helmet",
                  prefixIcon: Icon(Icons.add),
                  onSubmitted: (text) {
                    helmet = text;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              //TODO: DATABASE CONNECTION VARIABLE
              onPressed: () {
                print(rfid);
                print(alternatenumber);
                print(vehiclenumber);
                print(keepindex);
                print(selecteditem);
                setState(() {
                  return Alert(
                    context: context,
                    //image: Image(image: null),
                    style: AlertStyle(
                      animationType: AnimationType.shrink,
                      //constraints: BoxConstraints(minHeight: 100),
                      animationDuration: Duration(milliseconds: 500),
                    ),
                    type: AlertType.none,
                    title: "CHECK IN SUCCESSFUL",
                    buttons: [],
                  ).show();
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
                  'CHECK IN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 5),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
