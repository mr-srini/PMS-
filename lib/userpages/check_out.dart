import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pms/userpages/check_in.dart';
import 'package:pms/userpages/userstart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../clipper.dart';
import '../constants.dart';
import '../textfield.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController cRfid = TextEditingController();
  TextEditingController cTnumber = TextEditingController();
  TextEditingController cAnumber = TextEditingController();
  TextEditingController cVnumber = TextEditingController();
  bool Toggleprinter = true, ToggleSBVnumber = true;
  var rfid, ticketnumber, alternativenumber, vehiclenumber;
  @override
  Widget build(BuildContext context) {
    cRfid.addListener(() {
      rfid = cRfid.text;
    });
    cTnumber.addListener(() {
      ticketnumber = cTnumber.text;
    });
    cAnumber.addListener(() {
      alternativenumber = cAnumber.text;
    });
    cVnumber.addListener(() {
      vehiclenumber = cVnumber.text;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyCheckinClipper(),
              child: Container(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: TyperAnimatedTextKit(
                    onTap: () {
                      setState(() {});
                    },
                    text: ["You can check out here."],
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
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.search, color: Colors.black, size: 30),
                Text(
                  "VEHICLE NUMBER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                      letterSpacing: 2),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: 40.0,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ToggleSBVnumber
                        ? Colors.greenAccent[100]
                        : Colors.redAccent[100].withOpacity(0.5),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: ToggleSBVnumber ? 60.0 : 0.0,
                        right: ToggleSBVnumber ? 0.0 : 60.0,
                        child: InkWell(
                          onTap: toggleVNButton,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 100),
                              // ignore: missing_return
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  child: child,
                                  turns: animation,
                                );
                              },
                              child: ToggleSBVnumber
                                  ? Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                      size: 35.0,
                                    )
                                  : Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 35.0,
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: !ToggleSBVnumber,
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
            Visibility(
              visible: !ToggleSBVnumber,
              child: Center(
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 75,
                  inputType: TextInputType.text,
                  controller: cAnumber,
                  placeholder: "ALternative number",
                  prefixIcon: Icon(Icons.autorenew),
                  onSubmitted: (text) {
                    alternativenumber = text;
                  },
                  onTap: () {},
                ),
              ),
            ),
            Visibility(
              visible: !ToggleSBVnumber,
              child: Center(
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 75,
                  inputType: TextInputType.text,
                  controller: cTnumber,
                  placeholder: "Ticket number",
                  prefixIcon: Icon(Icons.add),
                  onSubmitted: (text) {
                    ticketnumber = text;
                  },
                  onTap: () {},
                ),
              ),
            ),
            Visibility(
              visible: ToggleSBVnumber,
              child: Center(
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 75,
                  inputType: TextInputType.text,
                  controller: cVnumber,
                  placeholder: "Vehicle number",
                  prefixIcon: Icon(Icons.input),
                  onSubmitted: (text) {
                    vehiclenumber = text;
                  },
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.print,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  "TAKE PRINT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                      letterSpacing: 2),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: 40.0,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Toggleprinter
                        ? Colors.greenAccent[100]
                        : Colors.redAccent[100].withOpacity(0.5),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: Toggleprinter ? 60.0 : 0.0,
                        right: Toggleprinter ? 0.0 : 60.0,
                        child: InkWell(
                          onTap: togglePrinterButton,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 100),
                              // ignore: missing_return
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  child: child,
                                  turns: animation,
                                );
                              },
                              child: Toggleprinter
                                  ? Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                      size: 35.0,
                                    )
                                  : Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 35.0,
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              //TODO: DATABASE CONNECTION VARIABLE
              onPressed: () {
                print(rfid);
                print(alternativenumber);
                print(ticketnumber);
                ToggleSBVnumber
                    ? print(vehiclenumber)
                    : print("Not used VNumber");
                setState(() {
                  //TODO: Validate with the DB and push a alert message
                  return Alert(
                    context: context,
                    //image: Image(image: null),
                    style: AlertStyle(
                      animationType: AnimationType.shrink,
                      animationDuration: Duration(milliseconds: 500),
                    ),
                    type: AlertType.none,
                    title: "CHECK OUT SUCCESSFUL",
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
                  'CHECK OUT',
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

  toggleVNButton() {
    setState(() {
      ToggleSBVnumber = !ToggleSBVnumber;
    });
  }

  togglePrinterButton() {
    setState(() {
      //TODO : Printer API Call with Printable PDF.
      Toggleprinter = !Toggleprinter;
    });
  }
}
