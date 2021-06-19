import 'package:flutter/material.dart';

class CampainPage extends StatefulWidget {
  _CampaignPage createState() => _CampaignPage();
}

class _CampaignPage extends State<CampainPage> {
  String setGreeting() {
    return "Good morning";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ([...Colors.primaries]..shuffle()).first,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white10,
          title: Container(
            margin: EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 10.0),
            child: Text(
              "Good morning",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w300),
            ),
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Text("Hello and welcome tot campaign page"),
            )
          ],
        )
        //bottomNavigationBar: Menu(),
        );
  }
}
