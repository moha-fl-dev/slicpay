import 'package:flutter/material.dart';

class FindMoreWidget extends StatefulWidget {
  const FindMoreWidget({Key? key}) : super(key: key);

  @override
  _FindMoreWidgetState createState() => _FindMoreWidgetState();
}

class _FindMoreWidgetState extends State<FindMoreWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      height: 150.0,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            highlightColor: ([...Colors.primaries]..shuffle()).first,
            onTap: () {
              print("Find more Widget");
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 100.0,
              height: 125.0,
              decoration: BoxDecoration(
                color: ([...Colors.primaries]..shuffle()).first,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/insurance.png",
                  ),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    _categories[index].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
