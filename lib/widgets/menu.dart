import 'package:flutte/screens/Inspiration.dart';
import 'package:flutte/screens/app_page.dart';
import 'package:flutte/screens/campaign.dart';
import 'package:flutte/screens/home.dart';
import 'package:flutte/screens/profile.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    AppPage(),
    InspirationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int index) {
          print("pageIndex $index");
          setState(() {
            pageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""), // bottomNAcigationBarItem
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: ""),
        ],
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(boxShadow: [
    //     BoxShadow(
    //       color: Colors.grey.withOpacity(0.3),
    //       spreadRadius: 10,
    //       blurRadius: 5,
    //       offset: Offset(0, 7), // changes position of shadow
    //     ),
    //   ]),
    //   child: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     elevation: 0.5,
    //     items: [
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.home), label: "Home"), // bottomNAcigationBarItem
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.campaign), label: "Campaign"),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.save_outlined), label: "Inspiration"),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.account_circle), label: "Account"),
    //     ],
    //   ),
    // );
  }
}
