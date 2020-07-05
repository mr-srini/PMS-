import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:pms/Printing/bluetoothprinter.dart';
import 'package:pms/Printing/wifiprinter.dart';
import '../ComponentsAndConstants/constants.dart';
import 'Methods/CinFormFields.dart';
import '../ComponentsAndConstants/flags.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class nCheckin extends StatefulWidget {
  @override
  _nCheckinState createState() => _nCheckinState();
}

// ignore: camel_case_types
class _nCheckinState extends State<nCheckin> {
  //TODO:List for selecting the vehicle type from DB.
  List<String> _vtype = ['Bike', 'car', 'Bus'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool bikeSelectedFlag = false;
  String _rfidNumber = "Scan RFID Card", selecteditem;
  bool isprint = false, validated = false;
  int groupValue = 1;
  // ignore: non_constant_identifier_names
  CinWidgets CinMethods = CinWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF3383CD),
        title: Text(
          "You can check in here.",
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Visibility(
                visible: rfidflag,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
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
                    Expanded(
                      child: FlatButton(
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
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
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
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CinMethods.buildANumber(context),
                  CinMethods.buildVNumber(context),
                  Visibility(
                    visible: bikeSelectedFlag,
                    child: CinMethods.buildNoHelmet(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      height: ktextfieldheight,
                      width: ktextfieldwidth,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "SELECT VEHICLE TYPE",
                                style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                                color: Colors.black,
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
                                  selecteditem = value;
                                  if (defaultEnabled) {
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
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Row(
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
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
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
            Container(
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
                child: Text(
                  'CHECK IN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 5),
                ),
                onPressed: () {
                  validate();
                  checkinInsert();
                  setState(() {
                    if (isprint && validated) {
                      if (groupValue == 2) {
                        print("BLUETOOTH");
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => BluetoothPrint(),
                          ),
                        );
                      } else if (groupValue == 1) {
                        WifiPrinter wifiPrinter = WifiPrinter();
                        wifiPrinter.wifiPrint();
                      }
                      _rfidNumber = "RFID SCAN";
                    }
                  });
                },
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
      validated = true;
      //TODO:Instead of print() hit API to insert into DB
      CinMethods.clear();
      return;
    } else {
      _formKey.currentState.save();
    }
  }

  Future<void> checkinInsert() async {
    Map data = {
      "RfidNumberT": _rfidNumber,
      "idNumber": CinMethods.alternateNumber,
      "vnumber": CinMethods.vehicleNumber,
      "vtype": selecteditem,
      "rfid_status": rfidflag.toString(),
    };
    print(data);
    print(rfidflag.toString());

    var response =
        await http.post('http://192.168.43.252/www/API/insert.php', body: data);
    try {
      if (response.statusCode == 200) {
        print("INSTERED");
      }
    } catch (Exception) {
      print("Agalla");
    }
  }
}
