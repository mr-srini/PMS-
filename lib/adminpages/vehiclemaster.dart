import 'package:flutter/material.dart';
import 'package:pms/ComponentsAndConstants/flags.dart' as flags;

import '../ComponentsAndConstants//constants.dart';
import '../ComponentsAndConstants//textfield.dart';

TextEditingController cVehicleType = TextEditingController();
TextEditingController cAccessKey = TextEditingController();
String vehicleType, accessKey;

class VehicleMaster extends StatefulWidget {
  @override
  _VehicleMasterState createState() => _VehicleMasterState();
}

class _VehicleMasterState extends State<VehicleMaster> {
  var statusSelected = 'Active';
  var _status = ['Active', 'Inactive'];
  @override
  Widget build(BuildContext context) {
    cVehicleType.addListener(() {
      vehicleType = cVehicleType.text;
    });
    cAccessKey.addListener(() {
      accessKey = cAccessKey.text;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Master'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.attach_money),
              controller: cVehicleType,
              placeholder: "Vehicle Type",
              onSubmitted: (text) {
                vehicleType = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.attach_money),
              controller: cAccessKey,
              placeholder: "Access Key",
              onSubmitted: (text) {
                accessKey = text;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xff818181),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: flags.isTax,
                      onChanged: (bool value) {
                        setState(() {
                          flags.isTax = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tax',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  'CREATE',
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
}
