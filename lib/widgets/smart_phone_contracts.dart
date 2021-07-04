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
        name: "Smart-Phones",
        title: "Smart phone contracts",
        image:
            "https://www.prijsvergelijken.nl/wp-content/plugins/prijsvergelijken/images/mobielvergelijker/phones/dvi_front_Iphone11_Zwart_305x450.png")
  ];

  @override
  Widget build(BuildContext context) {
    mobileProducts.shuffle();
    final parentColor = widget.parentColor;
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
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        mobileProducts[index].image.toString(),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Compare ${mobileProducts[index].name}",
                          style: TextStyle(
                            color: parentColor,
                          ),
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
