import 'package:flutte/screens/sim_only_screen.dart';
import 'package:flutter/material.dart';

class ProductTypes {
  String? name;
  String? title;
  String? image;

  ProductTypes({this.name, this.title, this.image});
}

class SmartPhoneContracts extends StatefulWidget {
  final Color parentColor;

  const SmartPhoneContracts({Key? key, required this.parentColor})
      : super(key: key);

  @override
  _SmartPhoneContractsState createState() => _SmartPhoneContractsState();
}

class _SmartPhoneContractsState extends State<SmartPhoneContracts> {
  List<ProductTypes> mobileProducts = [
    ProductTypes(
        name: "Sim-Only",
        title: "Sim only contracts",
        image:
            "https://www.prijsvergelijken.nl/wp-content/plugins/prijsvergelijken/images/mobielvergelijker/icons/sim_only.png"),
    ProductTypes(
        name: "Smart Phones",
        title: "Smart phone contracts",
        image:
            "https://www.prijsvergelijken.nl/wp-content/plugins/prijsvergelijken/images/mobielvergelijker/phones/dvi_front_Iphone11_Zwart_305x450.png"),
    ProductTypes(
        name: "Mobile insurance",
        title: "Mobile insurance contracts",
        image:
            "https://cdn3.iconfinder.com/data/icons/mobile-insurance-filled-outline-1/64/Mobile_Insurance_-_Filled_Outline_-_28-28-512.png"),
    ProductTypes(
        name: "Smartphone repair",
        title: "Mobile repair",
        image:
            "https://www.seekpng.com/png/full/226-2265552_related-wallpapers-cell-phone-repair.png")
  ];

  @override
  Widget build(BuildContext context) {
    mobileProducts.shuffle();
    // final parentColor = widget.parentColor;
    return Container(
      height: 325.0,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mobileProducts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print(mobileProducts[index].name);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[200]!,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mobileProducts[index].name.toString(),
                      ),
                    ),
                    FadeInImage.assetNetwork(
                      placeholder: "assets/loading_gif.gif",
                      image: mobileProducts[index].image.toString(),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          CircularProgressIndicator(),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          print(mobileProducts[index].title);

                          if (mobileProducts[index].name == "Sim-Only") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SimOnlyScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Compare ${mobileProducts[index].name}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
