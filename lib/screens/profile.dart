import 'package:flutte/screens/contracts_screen.dart';
import 'package:flutte/screens/personal_details.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ([...Colors.primaries]..shuffle()).first,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white10,
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
            "Hello (Name) ",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalDetails(),
                  ),
                );
                print("Hello world! - personal details");
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                    // color: Colors.grey[100],
                    border: Border.all(
                  color: Colors.grey[200]!,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal details",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    print("Going to contracts page");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContractsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Contracts"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Companies");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Companies"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Payments");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Payments"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Bills");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Bills"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("SUpport");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Support"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Service");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey[200]!,
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Service"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      //bottomNavigationBar: Menu(),
    );
  }
}
