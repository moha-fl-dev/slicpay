import 'dart:math';

import 'package:flutte/Enteties/contracts.dart';
import 'package:flutter/material.dart';

class InsuranceWidget extends StatefulWidget {
  final Contracts contracts;

  const InsuranceWidget({Key? key, required this.contracts}) : super(key: key);

  @override
  _InsuranceWidgetState createState() => _InsuranceWidgetState();
}

class _InsuranceWidgetState extends State<InsuranceWidget> {
  Widget buildInsuranceData(Contracts contracts) {
    Widget _widget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 150,
          child: Card(
            color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.shield,
                  size: 100.0,
                  color: ([...Colors.primaries]..shuffle()).first,
                ),
                Text(
                  "=",
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  Random().nextInt(4).toString(),
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          child: Card(
              color: ([...Colors.primaries]..shuffle()).first,
              elevation: 0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Hello world",
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    var contracts = widget.contracts;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: buildInsuranceData(contracts),
    );
  }
}
