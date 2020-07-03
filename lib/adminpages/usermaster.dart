import 'package:flutter/material.dart';
import 'package:pms/ComponentsAndConstants//constants.dart';
import 'package:pms/ComponentsAndConstants//textfield.dart';

TextEditingController cusername = TextEditingController();
TextEditingController cpassword = TextEditingController();
TextEditingController cphn = TextEditingController();
String username, password, phn;

class UserMaster extends StatefulWidget {
  @override
  _UserMasterState createState() => _UserMasterState();
}

class _UserMasterState extends State<UserMaster> {
  var statusSelected = 'Active', userSelected = 'User';
  var _status = ['Active', 'Inactive'];
  var _userType = ['Admin', 'User'];

//  void insertData() async{
//    String url = "http://192.168.43.196/www/PHP/UserMasterTable.php";
//    var res = await http.post(Uri.encodeFull(url),
//    body: {
//      'user_name':cusername.text,
//      'user_phone':cphn.text,
//      'user_status': statusSelected,
//      'user_type': userSelected,
//      'user_pass': cpassword.text,
//      'created_on': DateTime.now(),
//      'created_by': "admin",
//      'modified_on': DateTime.now(),
//      'modified_by': "admin",
//    });
//
//    var respBody = json.encode(res.body);
//    print(respBody);
//  }

  @override
  Widget build(BuildContext context) {
    cusername.addListener(() {
      username = cusername.text;
    });
    cpassword.addListener(() {
      password = cpassword.text;
    });
    cphn.addListener(() {
      phn = cphn.text;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('User Master'),
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
              prefixIcon: Icon(Icons.perm_identity),
              controller: cusername,
              placeholder: "Username",
              onSubmitted: (text) {
                username = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.text,
              prefixIcon: Icon(Icons.lock),
              controller: cpassword,
              placeholder: "Password",
              onSubmitted: (text) {
                password = text;
              },
            ),
            BeautyTextfield(
              cornerRadius: BorderRadius.circular(50),
              width: 400,
              height: 70,
              inputType: TextInputType.number,
              prefixIcon: Icon(Icons.phone),
              controller: cphn,
              placeholder: "Phone",
              onSubmitted: (text) {
                phn = text;
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
                    Text(
                      'User Type',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      items: _userType.map((String dropDownItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (String userSelected) {
                        setState(() {
                          this.userSelected = userSelected;
                        });
                      },
                      value: userSelected,
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
//                insertData();
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
