import 'package:flutter/material.dart';

class CateGorieSelectro extends StatefulWidget {
  @override
  _CateGorieSelectroState createState() => _CateGorieSelectroState();
}

class _CateGorieSelectroState extends State<CateGorieSelectro> {
  List<String> _categories = [
    'Gas',
    'Water',
    'Mobile',
    'Data',
    'WiFi',
    'Insurance',
    'Energy',
    'Gas',
    'Water',
    'Insurance',
    'Energy',
  ];

  IconData getCustomIcon(String type) {
    IconData icon = IconData(0xe14a, fontFamily: 'MaterialIcons'); // wifi

    switch (type) {
      case "Data":
        icon = IconData(0xe14a, fontFamily: 'MaterialIcons'); // wifi
        break;
      case "Gas":
        icon = IconData(0xea8e, fontFamily: 'MaterialIcons'); //gas
        break;
      case "Mobile":
        icon = IconData(0xe5c6, fontFamily: 'MaterialIcons'); //smartphone
        break;
      case "Water":
        icon = IconData(0xe6d0, fontFamily: 'MaterialIcons'); //water
        break;
      case "Energy":
        icon = IconData(0xe0ee, fontFamily: 'MaterialIcons'); // bolt
        break;
      case "Insurance":
        icon = IconData(0xe596, fontFamily: 'MaterialIcons'); // shield
        break;
      case "WiFi":
        icon = IconData(0xf114, fontFamily: 'MaterialIcons'); //house
        break;
    }

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5.0,
            color: Colors.grey[200]!,
          ),
        ),
        color: Colors.white,
      ),
      height: 100.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  getCustomIcon(
                    _categories[i],
                  ),
                  size: 25.0,
                  color: ([...Colors.primaries]..shuffle()).first,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _categories[i],
                  style: TextStyle(
                    color: ([...Colors.primaries]..shuffle()).first,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
