import 'dart:math';

import 'package:flutte/Enteties/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ProductOptionsScreen extends StatefulWidget {
  final Product product;
  final Color imageBackgroundColor;
  const ProductOptionsScreen(
      {Key? key, required this.product, required this.imageBackgroundColor})
      : super(key: key);

  @override
  _ProductOptionsScreenState createState() => _ProductOptionsScreenState();
}

class _ProductOptionsScreenState extends State<ProductOptionsScreen> {
  double _dataRangeValue = Random().nextInt(100).toDouble();
  double _callRangeValue = 99.0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    final appBarColor = widget.imageBackgroundColor;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_return_outlined,
              ),
            ),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: appBarColor,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      product.image.toString(),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  product.name.toString(),
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Colors.grey[200]!),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text("Data"),
                    ),
                    SfSlider(
                      activeColor: appBarColor,
                      inactiveColor: appBarColor.withOpacity(0.3),
                      min: 0.0,
                      max: 100.0,
                      value: _dataRangeValue,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _dataRangeValue = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text("Minutes"),
                    ),
                    SfSlider(
                      activeColor: appBarColor,
                      inactiveColor: appBarColor.withOpacity(0.3),
                      min: 60.0,
                      max: 150.0,
                      value: _callRangeValue,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _callRangeValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10.0),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print(index.toString());
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //color: index.isOdd ? Colors.white : Colors.grey[50],
                      border: Border.all(color: Colors.grey[100]!),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 100.0,
                    child: Wrap(
                      spacing: 10.0,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.0,
                          height: 60.0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://d321nzgqqa3thf.cloudfront.net/price_comparator/nl_telecom/providers/logos/3/small_2x/3.png?1534840325",
                            ),
                          ),
                        ),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: Text(
                            "60 GB",
                          ),
                        ),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: Text(
                            "300 M",
                          ),
                        ),
                        Container(
                          width: 75.0,
                          height: 75.0,
                          alignment: Alignment.center,
                          child: Text(
                            "2 yr contract",
                          ),
                        ),
                        Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: Text(
                            "price ${product.price1year.toString()}",
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.2,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextButton(
            onPressed: () {
              print("pressed me");
            },
            style: TextButton.styleFrom(
              backgroundColor: appBarColor,
            ),
            child: Text(
              "Buy",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
