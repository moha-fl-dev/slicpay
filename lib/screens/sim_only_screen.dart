import 'dart:convert';

import 'package:flutte/Enteties/sim_only_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../customScroll.dart';

class SimOnlyScreen extends StatefulWidget {
  const SimOnlyScreen({Key? key}) : super(key: key);

  @override
  _SimOnlyScreenState createState() => _SimOnlyScreenState();
}

class _SimOnlyScreenState extends State<SimOnlyScreen> {
  bool vifeG = false;
  double priceRange = 1.0;
  double _value = 40.0;
  List<SimOnlyContract> contracts = [];
  List<SimOnlyContract> filteredList = [];

  Future<String> loadSimOnlyContractsFromAssets() async {
    return await rootBundle.loadString("assets/sim_only_contracts.json");
  }

  Future loadSimOnlyContracts() async {
    String jsonString = await loadSimOnlyContractsFromAssets();

    final jsonResponse = json.decode(jsonString);

    final _contracts =
        jsonResponse.map<SimOnlyContract>(SimOnlyContract.fromJson).toList();

    _contracts.forEach((element) {
      setState(() {
        contracts.add(element);
        filteredList = contracts;
      });

      print(element.productName);
    });
  }

  @override
  void initState() {
    super.initState();
    loadSimOnlyContracts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,
              leading: IconButton(
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_outlined,
                ),
              ),
              expandedHeight: 60.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Sim-only contracts",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10.0),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: RatingBar(
                              itemSize: 25.0,
                              initialRating: priceRange,
                              direction: Axis.horizontal,
                              glow: false,
                              itemCount: 3,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.euro,
                                  color: Colors.deepOrange,
                                ),
                                half: Icon(Icons.star,
                                    color: Colors.deepOrangeAccent),
                                empty: Icon(
                                  Icons.euro_outlined,
                                  color:
                                      Colors.deepOrangeAccent.withOpacity(0.3),
                                ),
                              ),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              onRatingUpdate: (rating) {
                                print(rating.runtimeType);
                                double accounted = 9.0;

                                if (rating == 1.0) {
                                  accounted = 9.0;
                                }

                                if (rating == 2.0) {
                                  accounted = 13.0;
                                }

                                if (rating == 3.0) {
                                  accounted = 14.0;
                                }

                                setState(() {
                                  filteredList = contracts
                                      .where((element) =>
                                          (element.price > accounted))
                                      .toList();
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Switch(
                              value: vifeG,
                              onChanged: (value) {
                                setState(() {
                                  vifeG = value;
                                  if (value) {
                                    filteredList = contracts
                                        .where((element) =>
                                            (element.fiveG == vifeG))
                                        .toList();
                                  } else {
                                    filteredList = contracts;
                                  }
                                });
                              },
                              activeTrackColor: Colors.deepOrange,
                              activeColor: Colors.deepOrangeAccent,
                            ),
                          ),
                          vifeG
                              ? Text(
                                  '5G',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 18.0,
                                  ),
                                )
                              : Text(
                                  "4G",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  vifeG = false;
                                  filteredList = contracts;
                                  priceRange = 0.0;
                                });
                              },
                              child: Icon(
                                Icons.filter_alt,
                                color: vifeG ? Colors.deepOrange : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      //color: Colors.grey[50],
                      width: double.infinity,
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: contracts.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(contracts[index].provider);
                              setState(() {
                                filteredList = contracts
                                    .where((element) => (element.provider ==
                                        contracts[index].provider))
                                    .toList();
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              width: 50.0,
                              height: 20.0,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              ),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.contain,
                                placeholder: "assets/loading_gif.gif",
                                image: contracts[index].companyLogo,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text("Data"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: _value > 90
                              ? Icon(
                                  Icons.all_inclusive,
                                  color: Colors.orange,
                                )
                              : Icon(
                                  Icons.all_inclusive,
                                ),
                        ),
                      ],
                    ),
                    SfSlider(
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.deepOrange.withOpacity(0.3),
                      labelPlacement: LabelPlacement.onTicks,
                      min: 0.0,
                      max: 100.0,
                      value: _value,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text("Calls"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: _value > 90
                              ? Icon(
                                  Icons.all_inclusive,
                                  color: Colors.orange,
                                )
                              : Icon(
                                  Icons.all_inclusive,
                                ),
                        ),
                      ],
                    ),
                    SfSlider(
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.deepOrange.withOpacity(0.3),
                      min: 0.0,
                      max: 100.0,
                      value: _value,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    // Container(
                    //   //color: Colors.grey[50],
                    //   width: double.infinity,
                    //   height: 100.0,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     physics: BouncingScrollPhysics(),
                    //     itemCount: contracts.length,
                    //     itemBuilder: (context, index) {
                    //       return InkWell(
                    //         onTap: () {
                    //           print(contracts[index].provider);
                    //           setState(() {
                    //             filteredList = contracts
                    //                 .where((element) => (element.provider ==
                    //                     contracts[index].provider))
                    //                 .toList();
                    //           });
                    //         },
                    //         child: Container(
                    //           margin: EdgeInsets.all(10.0),
                    //           width: 50.0,
                    //           height: 20.0,
                    //           // color: Colors.white,
                    //           decoration: BoxDecoration(
                    //             border: Border(
                    //               top: BorderSide(
                    //                 color: Colors.grey[300]!,
                    //               ),
                    //               bottom: BorderSide(
                    //                 color: Colors.grey[300]!,
                    //               ),
                    //             ),
                    //           ),
                    //           child: FadeInImage.assetNetwork(
                    //             fit: BoxFit.contain,
                    //             placeholder: "assets/loading_gif.gif",
                    //             image: contracts[index].companyLogo,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.grey[100],
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: ListTile(
                        title: Text(filteredList[index].productName.toString()),
                        leading: Container(
                          width: 50.0,
                          height: 50.0,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.contain,
                              placeholder: "assets/loading_gif.gif",
                              image: filteredList[index].companyLogo),
                        ),
                        trailing: Text(
                          "€ ${filteredList[index].price}",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: filteredList[index].data,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' ${filteredList[index].calls}'),
                              TextSpan(
                                  text:
                                      filteredList[index].fiveG ? ' 5G' : ' 4G',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: filteredList.length,
              ),
            ),
            SliverPadding(padding: EdgeInsets.all(20.0)),
          ],
        ),
      ),
    );
  }
}
