import 'package:flutter/material.dart';
import 'package:pms/ModelClasses/VehiclePassMO.dart';
import 'package:pms/ModelClasses/VehiclePassAPI.dart';

//class VehiclePass extends StatefulWidget {
//  @override
//  _VehiclePassState createState() => _VehiclePassState();
//}
//
//class _VehiclePassState extends State<VehiclePass> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar : AppBar(
//        title: Text('Vehicle Pass'),
//      ),
//      body: Container(
//        child: FutureBuilder(
//          future: fetchProducts(),
//          builder: (context,snapshot){
//           if(snapshot.hasData){
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               shrinkWrap: true,
//               itemBuilder: (BuildContext context, index){
//                 VehiclePassMO passMo = snapshot.data[index];
//                 return Text('${passMo.vehiclePassId}');
//               }
//             );
//           }
//           return CircularProgressIndicator();
//          },
//        ),
//      ),
//    );
//  }
//}

class VehiclePass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Vehicle Pass'),
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index){
                  VehiclePassMO passMo = snapshot.data[index];
                  return  Text('${passMo.vehicleNumber}',style: TextStyle(fontSize: 20),);
                }
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
//FutureBuilder respi(){
//      FutureBuilder(
//        future: fetchProducts(),
//        builder: (context,snapshot){
//          if(snapshot.hasData){
//            return ListView.builder(
//    itemCount: snapshot.data.length,
//    shrinkWrap: true,
//    itemBuilder: (BuildContext context, index){
//    VehiclePassMO passMo = snapshot.data[index];
//    return  Text('${passMo.vehicleNumber}',style: TextStyle(fontSize: 20),);
//    }
//    );
//    }
//    return CircularProgressIndicator();
//    },
//    );
//}



//DataTable(

//rows: <DataRow>[
//DataRow(
//cells: <DataCell>[
//DataCell(
//ListTile(title: Text('${passMo.vehicleNumber}')),
//),
//DataCell(
//ListTile(title: Text('${passMo.passId}')),
//),
//DataCell(
//ListTile(title: Text('${passMo.createdOn}')),
//),
//]
//),
//],
//);