import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[Text("CHECK OUT PAGE")],
      ),
    );
  }
}