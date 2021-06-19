import 'package:flutte/Enteties/contracts.dart';
import 'package:flutter/material.dart';

class EnergieWiget extends StatefulWidget {
  final Contracts contracts;

  const EnergieWiget({Key? key, required this.contracts}) : super(key: key);

  @override
  _EnergieWigetState createState() => _EnergieWigetState();
}

class _EnergieWigetState extends State<EnergieWiget> {
  @override
  Widget build(BuildContext context) {
    var contracts = widget.contracts;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Center(
        //   child: Image.asset(
        //     contracts.logo.toString(),
        //     fit: BoxFit.contain,
        //     height: 100.0,
        //     width: 100.0,
        //   ),
        // ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          contracts.productName.toString(),
        )
      ],
    ));
  }
}
