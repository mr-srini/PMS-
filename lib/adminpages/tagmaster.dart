import 'package:flutter/material.dart';
import 'package:pms/constants.dart';
import 'package:pms/textfield.dart';

TextEditingController cRfid = TextEditingController();
TextEditingController caltrTag = TextEditingController();
TextEditingController cTagName = TextEditingController();

String rfid,altrTag,tagName;


class TagMaster extends StatefulWidget {
  @override
  _TagMasterState createState() => _TagMasterState();
}

class _TagMasterState extends State<TagMaster> {
  var statusSelected = 'Active';
  var _status = ['Active','Inactive'];
  @override
  Widget build(BuildContext context) {
    cRfid.addListener(() {rfid = cRfid.text;});
    caltrTag.addListener(() {altrTag = caltrTag.text;});
    cTagName.addListener(() {tagName = cTagName.text;});
    return Scaffold(
      appBar: AppBar(
        title: Text('Tag Master'),
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
              prefixIcon: Icon(Icons.rss_feed),
              controller: cRfid,
              placeholder: "RFID number",
              onSubmitted: (text) {
                rfid = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.confirmation_number),
              controller: caltrTag,
              placeholder: "Alternate Number",
              onSubmitted: (text) {
                altrTag = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.bookmark),
              controller: cTagName,
              placeholder: "Tag Name",
              onSubmitted: (text) {
                tagName = text;
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
