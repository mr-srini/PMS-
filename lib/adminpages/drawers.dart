import 'package:flutter/material.dart';
import 'package:pms/adminpages/Settings.dart';
import 'package:pms/adminpages/customermaster.dart';
import 'package:pms/adminpages/organizatinmaster.dart';
import 'package:pms/adminpages/slabmaster.dart';
import 'package:pms/adminpages/tagmaster.dart';
import 'package:pms/adminpages/taxmaster.dart';
import 'package:pms/adminpages/usermaster.dart';
import 'package:pms/adminpages/vehiclemaster.dart';
import 'package:pms/adminpages/vehiclepassdetails.dart';
import 'package:pms/adminpages/vehiclspass.dart';
class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('User Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>UserMaster()));},
            leading: Icon(Icons.perm_identity),
          ),
          ListTile(
            title: Text('Tag Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>TagMaster()));},
            leading: Icon(Icons.verified_user),
          ),
          ListTile(
            title: Text('Tax Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>TaxMaster()));},
            leading: Icon(Icons.attach_money),
          ),
          ListTile(
            title: Text('Vehicle Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>VehicleMaster()));},
            leading: Icon(Icons.directions_bike),
          ),
          ListTile(
            title: Text('Slab Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>SlabMaster()));},
            leading: Icon(Icons.bookmark),
          ),
          ListTile(
            title: Text('Organization Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>OrganizationMaster()));},
            leading: Icon(Icons.border_right),
          ),
          ListTile(
            title: Text('Customer Master'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>CustomerMaster()));},
            leading: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            title: Text('Vehicle Pass'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>VehiclePass()));},
            leading: Icon(Icons.format_indent_decrease),
          ),
          ListTile(
            title: Text('Vehicle Pass Details'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>VehiclePassDetails()));},
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text('Settings'),
            onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>Settings()));},
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
