import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeInsuranceAdresWidget extends StatefulWidget {
  const HomeInsuranceAdresWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeInsuranceAdresWidgetState createState() =>
      _HomeInsuranceAdresWidgetState();
}

class _HomeInsuranceAdresWidgetState extends State<HomeInsuranceAdresWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              color: Colors.grey[100],
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Zipcode eg: 1142 GB',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Huisnumber eg: 21',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Unit eg: 1',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                  Container(
                    width: double.infinity,
                    child: ToggleSwitch(
                      minWidth: 175,
                      minHeight: 60.0,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: ['I own', 'I rent'],
                      icons: [Icons.house_outlined, Icons.apartment_outlined],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
