import 'dart:math';

import 'package:flutter/material.dart';

class FindMobileRepair extends StatefulWidget {
  final Color parentColor;
  const FindMobileRepair({Key? key, required this.parentColor})
      : super(key: key);

  @override
  _FindMobileRepairState createState() => _FindMobileRepairState();
}

class _FindMobileRepairState extends State<FindMobileRepair> {
  int index = 0;
  List<String> recommendedRepairShops = ["GSM SHop", "Phone repair", "Makers"];

  @override
  Widget build(BuildContext context) {
    final parentColor = widget.parentColor;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        margin: EdgeInsets.all(20.0),
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Find mobile repair shop'),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      color: Colors.grey[200],
                      child: SizedBox(
                        child: TextButton(
                          onPressed: () {
                            print("Find repair mand");
                          },
                          child: Icon(Icons.search),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    print("Map clicked?");
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage("assets/map-image.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Vensyan',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: parentColor,
                        ),
                      ),
                      TextSpan(
                        text: ' recommended',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: recommendedRepairShops.map((e) {
                    index++;

                    if (index == recommendedRepairShops.length) {
                      index = 0;
                    }
                    return Container(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        title: Text(recommendedRepairShops[index].toString()),
                        leading: Icon(
                          Icons.recommend,
                          color: parentColor,
                          size: 40.0,
                        ),
                        trailing: Text(
                          "€ ${Random().nextInt(200)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Screen',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' Repair in Den haag'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
