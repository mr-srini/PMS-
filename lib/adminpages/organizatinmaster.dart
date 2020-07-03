import 'package:flutter/material.dart';

import '../ComponentsAndConstants/constants.dart';
import '../ComponentsAndConstants/textfield.dart';

TextEditingController cOrgName = TextEditingController();
TextEditingController cGstin = TextEditingController();
TextEditingController cAddress = TextEditingController();
TextEditingController cEmail = TextEditingController();
TextEditingController cPhn = TextEditingController();
TextEditingController cContactPerson = TextEditingController();

String orgName, gstin, address, email, phn, contactPerson;

class OrganizationMaster extends StatefulWidget {
  @override
  _OrganizationMasterState createState() => _OrganizationMasterState();
}

class _OrganizationMasterState extends State<OrganizationMaster> {
  @override
  Widget build(BuildContext context) {
    cOrgName.addListener(() {
      orgName = cOrgName.text;
    });
    cGstin.addListener(() {
      gstin = cGstin.text;
    });
    cAddress.addListener(() {
      address = cAddress.text;
    });
    cEmail.addListener(() {
      email = cEmail.text;
    });
    cPhn.addListener(() {
      phn = cPhn.text;
    });
    cContactPerson.addListener(() {
      contactPerson = cContactPerson.text;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization Master'),
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
              prefixIcon: Icon(Icons.business),
              controller: cOrgName,
              placeholder: "Organization Name",
              onSubmitted: (text) {
                orgName = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.attach_money),
              controller: cGstin,
              placeholder: "GSTIN",
              onSubmitted: (text) {
                gstin = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.home),
              controller: cAddress,
              placeholder: "Address",
              onSubmitted: (text) {
                address = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
              controller: cEmail,
              placeholder: "Email",
              onSubmitted: (text) {
                email = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.phone,
              prefixIcon: Icon(Icons.phone),
              controller: cPhn,
              placeholder: "Phone",
              onSubmitted: (text) {
                phn = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.perm_identity),
              controller: cContactPerson,
              placeholder: "Contact Person",
              onSubmitted: (text) {
                contactPerson = text;
              },
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
    );
  }
}
