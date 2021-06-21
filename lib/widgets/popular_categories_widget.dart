import 'package:flutte/Enteties/popular_categories.dart';
import 'package:flutter/material.dart';

class PopularCategoriesWidget extends StatefulWidget {
  @override
  _PopularCategoriesWidgetState createState() =>
      _PopularCategoriesWidgetState();
}

class _PopularCategoriesWidgetState extends State<PopularCategoriesWidget> {
  int index = 0;

  List<Popular> popular = [];

  List<String> categories = [
    "Home insurance",
    "Car insurance",
    "insurance",
    "Mobile insurance",
    "Utilities",
    "Water",
    "Wifi",
    "Smartphones",
    "Mobile data",
  ];

  List<String> images = [
    "home-insurance.png",
    "car_insurance.png",
    "insurance.png",
    "mobile_insurance.png",
    "home-utility.png",
    "water.png",
    "wifi.png",
    "smartphone.png",
    "wifi.png",
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      print(categories.length == images.length);
      for (int i = 0; i < categories.length; i++) {
        popular.add(Popular(category: categories[i], image: images[i]));
      }

      popular.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 50.0,
        horizontal: 0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Categories",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Wrap(
            runSpacing: 5.0,
            spacing: 5.0,
            children: popular.map((p) {
              index++;

              if (index == categories.length) {
                index = 0;
              }

              return InkWell(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/${p.image.toString()}"),
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Text(p.category.toString()),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
