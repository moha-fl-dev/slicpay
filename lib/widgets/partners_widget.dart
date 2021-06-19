import 'package:flutter/material.dart';

class Partner {
  String? partnerName;
  String? partnerAvatar;

  Partner({this.partnerName, this.partnerAvatar});
}

class PartnerWidget extends StatefulWidget {
  @override
  _PartnerWidgetState createState() => _PartnerWidgetState();
}

class _PartnerWidgetState extends State<PartnerWidget> {
  List<Partner> partners = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      partners = partnerChip();
    });
  }

  List<Partner> partnerChip() {
    final List<Partner> partner = [];

    final List<String> partnerNames = [
      'Vodafone',
      'T-mobile',
      'Tele2',
      'Verizon',
      'AT&T',
      'Virgin',
      'VattenFall',
      'Eneco',
      'Tele2',
      'Verizon',
      'AT&T',
      'Virgin',
    ];

    final List<String> av = [
      'VF',
      'TM',
      'T2',
      'VZ',
      'AT',
      'VG',
      'VF',
      'EC',
      'T2',
      'VZ',
      'AT',
      'VG',
    ];

    for (int i = 0; i < partnerNames.length; i++) {
      partner.add(Partner(partnerName: partnerNames[i], partnerAvatar: av[i]));
    }
    return partner;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Partners",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            runSpacing: 5.0,
            spacing: 25.0,
            children: partners.map((p) {
              return ActionChip(
                backgroundColor: ([...Colors.primaries]..shuffle()).first,
                avatar: CircleAvatar(
                  backgroundColor: ([...Colors.primaries]..shuffle()).first,
                  child: Text(
                    p.partnerAvatar.toString(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                label: Text(
                  p.partnerName.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                labelStyle: TextStyle(),
                onPressed: () {
                  print(
                      'If you stand for nothing, Burr, what’ll you fall for?');
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
