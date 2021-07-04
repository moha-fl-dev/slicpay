import 'package:flutter/material.dart';

class SmartPhoneContractsBody extends StatefulWidget {
  const SmartPhoneContractsBody({Key? key}) : super(key: key);

  @override
  _SmartPhoneContractsBodyState createState() =>
      _SmartPhoneContractsBodyState();
}

class _SmartPhoneContractsBodyState extends State<SmartPhoneContractsBody> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              print(
                index.toString(),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                //color: index.isOdd ? Colors.white : Colors.grey[50],
                border: Border.all(color: Colors.grey[100]!),
                borderRadius: BorderRadius.circular(5.0),
              ),
              height: 100.0,
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Text(
                  "hello world!",
                ),
              ),
            ),
          );
        },
        childCount: 2,
      ),
    );
  }
}
