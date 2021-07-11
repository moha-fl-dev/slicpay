import 'dart:convert';
import 'package:flutte/Enteties/mobile_contracts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class SmartPhoneContractsBody extends StatefulWidget {
  final Color parentColor;
  const SmartPhoneContractsBody({Key? key, required this.parentColor})
      : super(key: key);

  @override
  _SmartPhoneContractsBodyState createState() =>
      _SmartPhoneContractsBodyState();
}

class _SmartPhoneContractsBodyState extends State<SmartPhoneContractsBody> {
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed nisi pellentesque, vehicula magna at, scelerisque leo. Maecenas tempor nunc vitae aliquam aliquet. Mauris sagittis lectus at sapien tempus, non posuere mi elementum. Morbi vehicula nulla quis nulla volutpat luctus. Suspendisse a facilisis nibh. Suspendisse sapien magna, accumsan vel vulputate id, sollicitudin ut massa. Vivamus malesuada tellus ut mi viverra, at dignissim velit ullamcorper.";

  String line = "|";

  final List<MobileContract> contracts = [];

  Future<String> loadMobileContractsFromAssets() async {
    return await rootBundle.loadString("assets/mobile_contracts.json");
  }

  Future loadMobileContracts() async {
    String jsonString = await loadMobileContractsFromAssets();

    final jsonResponse = json.decode(jsonString);

    final _contracts =
        jsonResponse.map<MobileContract>(MobileContract.fromJson).toList();

    _contracts.forEach((element) {
      setState(() {
        contracts.add(element);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadMobileContracts();
  }

  @override
  Widget build(BuildContext context) {
    final parentColor = widget.parentColor;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // final count = index + 1;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 10.0,
                children: <Widget>[
                  // Row(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.symmetric(
                  //           horizontal: 20.0, vertical: 0.0),
                  //       width: 100,
                  //       height: 20.0,
                  //       child: Text(
                  //         count.toString(),
                  //         style: TextStyle(
                  //           color: parentColor,
                  //           fontSize: 20.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                    width: 100,
                    height: 250,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/loading_gif.gif",
                      image: contracts[index].productImage.toString(),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          CircularProgressIndicator(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 220.0,
                          child: Text(
                            contracts[index].productName.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: parentColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: RatingBar(
                            itemSize: 25.0,
                            glow: true,
                            ignoreGestures: true,
                            initialRating: contracts[index].rating,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: parentColor,
                              ),
                              half: Icon(
                                Icons.star,
                                color: parentColor,
                              ),
                              empty: Icon(
                                Icons.star_border,
                                color: parentColor.withOpacity(0.3),
                              ),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 200,
                          height: 70.0,
                          child: Text(
                            contracts[index].body.toString(),
                            maxLines: 3,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                            "${contracts[index].data} | ${contracts[index].callMinutes} calls"),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            "24 monhts € ${contracts[index].price2Year} | 12 months € ${contracts[index].price1Year} "),
                        Container(
                          width: 230.0,
                          height: 50.0,
                          child: Row(
                            children: [
                              contracts[index].trending
                                  ? Icon(
                                      Icons.trending_up_outlined,
                                      size: 30.0,
                                      color: Colors.green,
                                    )
                                  : Text(""),
                              SizedBox(
                                width: 10.0,
                              ),
                              contracts[index].vensyanRecomended
                                  ? Icon(
                                      Icons.task_alt,
                                      color: Colors.deepOrangeAccent,
                                      size: 30.0,
                                    )
                                  : Text(""),
                              SizedBox(
                                width: 10.0,
                              ),
                              contracts[index].vensyanRecomended
                                  ? RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: 'Vensyan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: ' approved'),
                                        ],
                                      ),
                                    )
                                  : Text(""),
                              SizedBox(
                                width: 10.0,
                              ),
                              contracts[index].trending &&
                                      contracts[index].vensyanRecomended
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.red,
                                      highlightColor: Colors.yellow,
                                      child: Icon(Icons.local_fire_department),
                                    )
                                  : Text(""),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/loading_gif.gif",
                            image: contracts[index].companyLogo.toString(),
                            imageErrorBuilder: (context, error, stackTrace) =>
                                CircularProgressIndicator(),
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            width: 240.0,
                            height: 50.0,
                            child: TextButton(
                              onPressed: () {
                                print(contracts[index].productImage);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        parentColor.withOpacity(0.2)),
                                overlayColor: MaterialStateProperty.all<Color>(
                                    parentColor.withOpacity(0.6)),
                              ),
                              child: Text(
                                "Configure",
                                style: TextStyle(
                                  color: parentColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: contracts.length,
      ),
    );
  }
}
