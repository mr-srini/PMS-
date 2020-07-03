import 'package:flutter/material.dart';

import '../ComponentsAndConstants/constants.dart';
import '../ComponentsAndConstants/textfield.dart';

TextEditingController cSlabName = TextEditingController();
TextEditingController cTotalHr = TextEditingController();
TextEditingController cAmount = TextEditingController();
TextEditingController cValidFor = TextEditingController();

String slabName, totalHr, amount, validFor;

class SlabMaster extends StatefulWidget {
  @override
  _SlabMasterState createState() => _SlabMasterState();
}

bool ticketSlab = true;

class _SlabMasterState extends State<SlabMaster> {
  var _status = ['Active', 'Inactive'];
  var _vehicleType = ['Select Vehicle', 'Bus', 'Car', 'Bike', 'helmet'];
  var vehicleSelected = 'Select Vehicle';
  var statusSelected = 'Active';
  @override
  Widget build(BuildContext context) {
    cSlabName.addListener(() {
      slabName = cSlabName.text;
    });
    cTotalHr.addListener(() {
      totalHr = cTotalHr.text;
    });
    cAmount.addListener(() {
      amount = cAmount.text;
    });
    cValidFor.addListener(() {
      validFor = cValidFor.text;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Slab Master'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "TICKET SLAB",
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
                      color: ticketSlab
                          ? Colors.greenAccent[100]
                          : Colors.greenAccent[100].withOpacity(0.5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                          top: 3.0,
                          left: ticketSlab ? 60.0 : 0.0,
                          right: ticketSlab ? 0.0 : 60.0,
                          child: InkWell(
                            onTap: ticketSlabButton,
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
                                child: ticketSlab
                                    ? Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                        size: 35.0,
                                      )
                                    : Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                        size: 35.0,
                                      )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "PASS SLAB",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 2),
                  ),
                ],
              ),
              BeautyTextfield(
                cornerRadius: BorderRadius.circular(50),
                width: 400,
                height: 70,
                inputType: TextInputType.text,
                prefixIcon: Icon(Icons.receipt),
                controller: cSlabName,
                placeholder: "Ticket Slab Name",
                onSubmitted: (text) {
                  slabName = text;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 75,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xff818181),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        items: _vehicleType.map((String dropDownItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownItem,
                            child: Text(
                              dropDownItem,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (String selectedStatus) {
                          setState(() {
                            this.vehicleSelected = selectedStatus;
                          });
                        },
                        value: vehicleSelected,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !ticketSlab,
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 70,
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.access_time),
                  controller: cTotalHr,
                  placeholder: "Total hours",
                  onSubmitted: (text) {
                    totalHr = text;
                  },
                ),
              ),
              Visibility(
                visible: ticketSlab,
                child: BeautyTextfield(
                  cornerRadius: BorderRadius.circular(50),
                  width: 400,
                  height: 70,
                  inputType: TextInputType.text,
                  prefixIcon: Icon(Icons.today),
                  controller: cValidFor,
                  placeholder: "Valid for",
                  onSubmitted: (text) {
                    validFor = text;
                  },
                ),
              ),
              BeautyTextfield(
                cornerRadius: BorderRadius.circular(50),
                width: 400,
                height: 70,
                inputType: TextInputType.text,
                prefixIcon: Icon(Icons.attach_money),
                controller: cAmount,
                placeholder: "Amount",
                onSubmitted: (text) {
                  amount = text;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 75,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xff818181),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        items: _status.map((String dropDownItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownItem,
                            child: Text(
                              dropDownItem,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                        onChanged: (String selectedStatus) {
                          setState(() {
                            this.statusSelected = selectedStatus;
                          });
                        },
                        value: statusSelected,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        kbuttonColor,
                      ],
                    ),
                    color: kbuttonColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                  child: Text(
                    'REGISTER',
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

  ticketSlabButton() {
    setState(() {
      ticketSlab = !ticketSlab;
    });
  }
}
