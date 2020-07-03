import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../ComponentsAndConstants/constants.dart';
import '../ComponentsAndConstants/textfield.dart';

String name, phn, dl, address, totalvehicle;
int vehicleAllowed;
TextEditingController cname = TextEditingController();
TextEditingController cphn = TextEditingController();
TextEditingController cdl = TextEditingController();
TextEditingController caddress = TextEditingController();
TextEditingController ctotalVehicle = TextEditingController();
TextEditingController cvehicleAllowed = TextEditingController();

class CustomerMaster extends StatefulWidget {
  @override
  _CustomerMasterState createState() => _CustomerMasterState();
}

class _CustomerMasterState extends State<CustomerMaster> {
  var statusSelected = 'Active';
  var orgSelected = 'prestige';
  var _status = ['Active', 'Inactive'];
  var _orgainzation = ['prestige', 'sankalp'];
  @override
  Widget build(BuildContext context) {
    cname.addListener(() {
      name = cname.text;
    });
    cphn.addListener(() {
      phn = cphn.text;
    });
    cdl.addListener(() {
      dl = cdl.text;
    });
    caddress.addListener(() {
      address = caddress.text;
    });
    ctotalVehicle.addListener(() {
      totalvehicle = ctotalVehicle.text;
    });
    cvehicleAllowed.addListener(() {
      vehicleAllowed = cvehicleAllowed.text as int;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Master'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: cname,
              placeholder: "Name",
              onSubmitted: (text) {
                name = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: cphn,
              placeholder: "Phone",
              onSubmitted: (text) {
                phn = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: cdl,
              placeholder: "DL Number",
              onSubmitted: (text) {
                dl = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: caddress,
              placeholder: "Address",
              onSubmitted: (text) {
                address = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: ctotalVehicle,
              placeholder: "Number of Vehicles",
              onSubmitted: (text) {
                totalvehicle = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 75,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.supervised_user_circle),
              controller: cvehicleAllowed,
              placeholder: "Phone",
              onSubmitted: (text) {
                vehicleAllowed = text as int;
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
                      'Organization',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      items: _orgainzation.map((String dropDownItem) {
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
                          this.orgSelected = selectedStatus;
                        });
                      },
                      value: orgSelected,
                    ),
                  ],
                ),
              ),
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
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
