import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:pms/ModelClasses/ticketInit.dart';
import 'package:pms/Printing/bluetoothprintercheckout.dart';
import 'package:pms/login_page.dart';
import '../UserPages2.0/Methods/CoutFormFields.dart';
import '../ComponentsAndConstants/constants.dart';
import '../ComponentsAndConstants/flags.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class nCheckout extends StatefulWidget {
  @override
  _nCheckoutState createState() => _nCheckoutState();
}

// ignore: camel_case_types
class _nCheckoutState extends State<nCheckout> {
  ScanResult codeScanner, GlobalTNumber;
  int groupValue = 1;
  String qrCodeResult = "SCAN TO KNOW THE QR RESULTS";
  String _rfidNumber = "RFID SCAN";
  TicketInit TicketNumberObject;
  // ignore: non_constant_identifier_names
  CoutWidgets CoutMethods = CoutWidgets();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  bool isprint = false, validated = false, ToggleSBVnumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xFF3383CD),
          title: Text(
            "You can check out here.",
            style: TextStyle(
                fontSize: 25.0, fontWeight: FontWeight.bold, letterSpacing: 2),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80.0,
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
              height: 20.0,
            ),
            Visibility(
              visible: !ToggleSBVnumber,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Visibility(
                  visible: rfidflag,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            getTicketNumberFromAlternateId(
                                CoutMethods.alternateNumber);
                            Stream<NDEFMessage> stream = NFC.readNDEF();
                            stream.listen((NDEFMessage message) {
                              print(message.data);
                              _rfidNumber = message.data;
                            });
                          });
                        },
                        icon: Icon(Icons.tap_and_play),
                        iconSize: 30.0,
                        splashColor: Colors.lightGreenAccent.withOpacity(0.5),
                      ),
                      FlatButton(
                        padding: EdgeInsets.only(
                            left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
                        onPressed: () {
                          setState(() {
                            Stream<NDEFMessage> stream = NFC.readNDEF();
                            stream.listen((NDEFMessage message) {
                              print(message.data);
                              _rfidNumber = message.data;
                            });
                          });
                        },
                        child: Center(
                          child: Text(
                            _rfidNumber,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Visibility(
                    child: CoutMethods.buildVNumber(context),
                    visible: ToggleSBVnumber,
                  ),
                  Visibility(
                    child: CoutMethods.buildANumber(context),
                    visible: !ToggleSBVnumber,
                  ),
                  Visibility(
                    child: CoutMethods.buildticketNumber(context),
                    visible: !ToggleSBVnumber,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Visibility(
              visible: !ToggleSBVnumber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.print, color: Colors.black, size: 25),
                  Text(
                    "PRINT RECIEPT",
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
                      color: isprint
                          ? Colors.greenAccent[100]
                          : Colors.redAccent[100].withOpacity(0.5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: isprint ? 60.0 : 0.0,
                          right: isprint ? 0.0 : 60.0,
                          child: InkWell(
                            onTap: isprintToggled,
                            child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 100),
                                // ignore: missing_return
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return RotationTransition(
                                    child: child,
                                    turns: animation,
                                  );
                                },
                                child: isprint
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
            ),
            Visibility(
              visible: isprint,
              child: Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "WiFi Printer",
                        style: TextStyle(
                            letterSpacing: 3.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            groupValue = T;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Bluetooth Printer",
                        style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            groupValue = T;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: !ToggleSBVnumber,
              child: Container(
                decoration: BoxDecoration(
                  color: kbuttonColor,
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      kbuttonColor,
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 5),
                  ),
                  onPressed: () {
                    validate();
                    setState(() {
                      if (isprint && validated)
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => BluetoothPrintCheckOut(),
                          ),
                        );
                      _rfidNumber = "Scan RFID Card";
                      CoutMethods.readOnly = false;
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: ToggleSBVnumber,
              child: FlatButton(
                //TODO: DATABASE CONNECTION VARIABLE
                onPressed: () {
                  validate();
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kbuttonColor,
                    borderRadius: BorderRadius.circular(15),
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
                    'SHOW DATA',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 5),
                  ),
                ),
              ),
            ),
            Visibility(
              //TODO: QUERY WITH Tid For Ticket Number
              visible: !ToggleSBVnumber,
              child: FlatButton(
                padding: EdgeInsets.only(
                    left: 60.0, right: 60.0, top: 15.0, bottom: 15.0),
                onPressed: () async {
                  codeScanner = await BarcodeScanner.scan();
                  setState(() {
                    qrCodeResult = codeScanner.rawContent;
                    getTicketNumberFromScanner(qrCodeResult);
                  });
                },
                child: Text(
                  "OPEN SCANNER",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  isprintToggled() {
    setState(() {
      isprint = !isprint;
    });
  }

  // ignore: missing_return
  Future<String> readNFC() {
    Stream<NDEFMessage> stream = NFC.readNDEF();
    stream.listen((NDEFMessage message) {
      print(message.data.toUpperCase());
      return message.data;
    });
  }

  validate() {
    if (_formKey.currentState.validate()) {
      checkout();
      validated = true;

      return;
    } else {
      _formKey.currentState.save();
    }
  }

  toggleVNButton() {
    setState(() {
      ToggleSBVnumber = !ToggleSBVnumber;
    });
  }

  Future<void> getTicketNumberFromScanner(String codeResult) async {
    Map data = {
      'transaction_id': codeResult,
    };
    print(data);
    var response = await http.post(
        'http://192.168.43.252/www/API/getTicketNumberTid.php',
        body: data);
    try {
      if (response.statusCode == 200) {
        print("inside");
        var ticketNumberJason = json.decode(response.body);
        print(ticketNumberJason);
        for (var tnumber in ticketNumberJason) {
          TicketNumberObject = TicketInit.fromJson(tnumber);
        }
        print(TicketNumberObject.ticketNumber);
        setState(() {
          if (TicketNumberObject.ticketNumber == false) {
            //TODO: ALTER MESSAGE AID DOESNT EXITS.
          } else
            CoutMethods.setTicketNumber(TicketNumberObject.ticketNumber);
        });
      }
    } catch (Exception) {
      print("ERROR");
    }
  }

  Future<void> getTicketNumberFromAlternateId(String alterNumber) async {
    Map data = {
      'alternate_id': alterNumber,
    };
    print(data);
    var response = await http.post(
        'http://192.168.43.252/www/API/getTicketNumberAid.php',
        body: data);
    try {
      if (response.statusCode == 200) {
        print("inside");
        var ticketNumberJason = json.decode(response.body);
        print(ticketNumberJason);
        for (var tnumber in ticketNumberJason) {
          TicketNumberObject = TicketInit.fromJson(tnumber);
        }
        print(TicketNumberObject.ticketNumber);
        setState(() {
          if (TicketNumberObject.ticketNumber == false) {
            //TODO: ALTER MESSAGE AID DOESNT EXITS.
          } else
            CoutMethods.setTicketNumber(TicketNumberObject.ticketNumber);
        });
      }
    } catch (Exception) {
      print("ERROR");
    }
  }

  Future<void> checkout() async {
    Map data = {
      "ticket_number": CoutMethods.ticketNumber,
      "user_name": nameDisp,
    };
    print(data);
    var response =
        await http.post('http://192.168.43.252/www/API/update.php', body: data);
    try {
      if (response.statusCode == 200) {
        print("inside");
      }
    } catch (Exception) {
      print("ERROR");
    }
  }
}
