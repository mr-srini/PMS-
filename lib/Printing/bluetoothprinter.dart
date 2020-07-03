import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/material.dart';

class BluetoothPrint extends StatefulWidget {
  @override
  _BluetoothPrintState createState() => _BluetoothPrintState();
}

class _BluetoothPrintState extends State<BluetoothPrint> {
  PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3383CD),
        title: Text(
          'AVAILABLE PRINTERS',
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) => ListTile(
          onTap: () async {
            //TODO: FETCH THE CALCULATED DETAILS OF THE TICKET AND PRINT

            bluetoothPrint(position);
          },
          title: Text(_devices[position].name),
          subtitle: Text(_devices[position].address),
        ),
        itemCount: _devices.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("SEARCH"),
        backgroundColor: Color(0xFF3383CD),
        onPressed: () {
          printerManager.startScan(Duration(seconds: 1));
          printerManager.scanResults.listen((scannedDevices) {
            setState(() {
              _devices = scannedDevices;
            });
          });
        },
        icon: Icon(Icons.search),
        splashColor: Colors.greenAccent,
      ),
    );
  }

  List<int> returnTid(String source) {
    int size = source.length;
    List<int> tid = new List();
    int temp;
    for (int i = 0; i <= size - 1; i++) {
      temp = int.parse(source[i]);
      print(temp);
      tid.add(temp);
    }
    print(tid);
    return tid;
  }

  bluetoothPrint(position) {
    printerManager.selectPrinter(_devices[position]);
    Ticket ticket = Ticket(PaperSize.mm58);
    ticket.text('Demo text',
        styles: PosStyles(
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
          align: PosTextAlign.center,
          fontType: PosFontType.fontA,
          reverse: false,
          underline: true,
        ));
    ticket.emptyLines(2);
    ticket.row([
      PosColumn(
        text: 'Item     ',
        width: 9,
        styles: PosStyles(align: PosTextAlign.right, underline: true),
      ),
      PosColumn(
        text: 'Price',
        width: 3,
        styles: PosStyles(align: PosTextAlign.right, underline: true),
      ),
    ]);
    //TODO: GET TRANSCATION ID FROM DATABASE.
    final List<dynamic> barData = returnTid("36");
    ticket.barcode(Barcode.code39(barData));
    ticket.feed(1);
    ticket.cut();
    printerManager.printTicket(ticket).then((result) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(result.msg)));
    }).catchError((error) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }
}
