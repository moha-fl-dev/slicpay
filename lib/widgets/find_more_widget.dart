import 'package:flutter/material.dart';

class FindMoreWidget extends StatefulWidget {
  const FindMoreWidget({Key? key}) : super(key: key);

  @override
  _FindMoreWidgetState createState() => _FindMoreWidgetState();
}

class _FindMoreWidgetState extends State<FindMoreWidget> {
  List<String> _categories = [
    'Gas',
    'Insurance',
    "Motor insurance",
    "Carriers"
  ];

  List<String> images = [
    "assets/home-utility.png",
    "assets/insurance.png",
    "assets/car_insurance.png",
    "assets/carriers.png",
    "assets/smartphone.png",
  ];

  String bannerText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas metus metus, egestas in augue et, tempus semper arcu. Aliquam sollicitudin nulla arcu, non pulvinar nisl ultrices a. Sed dolor mi, viverra eu porta eu, viverra vel tortor. In non orci at arcu tincidunt placerat a at mauris. Aenean ut velit bibendum, ornare libero in, pulvinar quam. Vestibulum nec est ultricies, tempor sem in, efficitur leo. Vestibulum neque est, accumsan et mattis sed, ultricies malesuada dolor. Nunc maximus mauris vel dolor semper, at lobortis quam faucibus. Donec interdum condimentum ex ut imperdiet. Morbi vel dolor non ante ullamcorper pulvinar a a velit. Nunc a felis fringilla, malesuada orci in, faucibus nunc. Cras molestie aliquam magna egestas malesuada.";

  @override
  Widget build(BuildContext context) {
    images.shuffle();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      height: 500.0,
      width: double.infinity,
      child: Scrollbar(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InkWell(
              highlightColor: ([...Colors.primaries]..shuffle()).first,
              onTap: () {
                print("Find more Widget");
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: 350.0,
                height: 125.0,
                decoration: BoxDecoration(
                  color: ([...Colors.primaries]..shuffle()).first,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      images[index].toString(),
                    ),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      bannerText,
                      softWrap: false,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
