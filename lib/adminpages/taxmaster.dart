import 'package:flutter/material.dart';
import 'package:pms/constants.dart';
import 'package:pms/textfield.dart';

TextEditingController cTax = TextEditingController();
TextEditingController cTaxValue = TextEditingController();
TextEditingController cCgst = TextEditingController();
TextEditingController cSgst = TextEditingController();
TextEditingController cMisc1Name = TextEditingController();
TextEditingController cMiscc1Value = TextEditingController();
TextEditingController cMisc2Name = TextEditingController();
TextEditingController cMiscc2Value = TextEditingController();

String tax,taxValue,cgst,sgst,misc1Name,misc1Value,misc2Name,misc2Value;

class TaxMaster extends StatefulWidget {
  @override
  _TaxMasterState createState() => _TaxMasterState();
}

class _TaxMasterState extends State<TaxMaster> {
  var statusSelected = 'Active';
  var _status = ['Active','Inactive'];
  @override
  Widget build(BuildContext context) {
    cTax.addListener(() {tax = cTax.text;});
    cTaxValue.addListener(() {taxValue = cTaxValue.text;});
    cCgst.addListener(() {cgst = cCgst.text;});
    cSgst.addListener(() {sgst = cSgst.text;});
    cMisc1Name.addListener(() {misc1Name = cMisc1Name.text;});
    cMiscc1Value.addListener(() {misc1Value = cMiscc1Value.text;});
    cMisc2Name.addListener(() {misc2Name = cMisc2Name.text;});
    cMiscc2Value.addListener(() {misc2Value = cMiscc2Value.text;});
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Master'),
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
              controller: cTax,
              placeholder: "Tax name",
              onSubmitted: (text) {
                tax = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
              controller: cTaxValue,
              placeholder: "Tax value(%)",
              onSubmitted: (text) {
                taxValue = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
              controller: cCgst,
              placeholder: "CGST value(%)",
              onSubmitted: (text) {
                cgst = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
              controller: cSgst,
              placeholder: "SGST value(%)",
              onSubmitted: (text) {
                sgst = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.attach_money),
              controller: cMisc1Name,
              placeholder: "Miscellaneous 1 Name",
              onSubmitted: (text) {
                misc1Name = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
              controller: cMiscc1Value,
              placeholder: "Miscellaneous 1 Value",
              onSubmitted: (text) {
                misc1Value = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.attach_money),
              controller: cMisc2Name,
              placeholder: "Miscellaneous 2 Name",
              onSubmitted: (text) {
                misc2Name = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.attach_money),
              controller: cMiscc2Value,
              placeholder: "Miscellaneous 2 Value",
              onSubmitted: (text) {
                misc2Value = text;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xff818181),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Status',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      items: _status.map((String dropDownItem){
                        return DropdownMenuItem<String>(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String selectedStatus){
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
              height: 10,
            ),
            FlatButton(
              onPressed: () {
              },
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
                padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 75),
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

