import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/adminpages/drawers.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      drawer: Drawers(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Todays Collection Details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check in Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check out Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Total amount',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Weekly Collection Details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check in Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check out Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Total amount',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '100',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Cumulative Collection Details',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check in Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '100',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Check out Count',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '70',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              child: Text(
                                'Total amount',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            subtitle: Container(
                              child: Text(
                                '3348',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
