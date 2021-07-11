import 'package:collapsible/collapsible.dart';
import 'package:flutte/Enteties/home_insurance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeInsuranceList extends StatefulWidget {
  final List<HomeInsuance> insuranceList;
  HomeInsuranceList({
    Key? key,
    required this.insuranceList,
  }) : super(key: key);

  @override
  _HomeInsuranceListState createState() => _HomeInsuranceListState();
}

class _HomeInsuranceListState extends State<HomeInsuranceList> {
  Widget _moreInformation() => Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("Hello world!"),
                ),
                Expanded(
                  flex: 1,
                  child: Text("data"),
                ),
              ],
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final insuranceList = widget.insuranceList;

    return Container(
      child: ListView.builder(
        itemCount: insuranceList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final insurance = insuranceList[index];
          return Container(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70.0,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.contain,
                              placeholder: "assets/loading_gif.gif",
                              image: insurance.logo),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[200]!,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Container(
                                  child: RatingBar(
                                    itemSize: 20.0,
                                    glow: true,
                                    ignoreGestures: true,
                                    initialRating: insurance.reviews,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      half: Icon(
                                        Icons.star,
                                        color: Colors.blueAccent,
                                      ),
                                      empty: Icon(
                                        Icons.star_border,
                                        color: Colors.blue.withOpacity(0.3),
                                      ),
                                    ),
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[200]!,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey[100],
                            ),
                            height: 60.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Price p/m",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  "€ ${insurance.price.toString()}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All risk",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                            Text(
                              "Dedcutible: € ${insurance.deductible}",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        if (insurance.reviews > 3.2)
                          Icon(
                            Icons.local_fire_department_outlined,
                            color: Colors.redAccent,
                          ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextButton.icon(
                            onPressed: () {
                              print(insurance.companyName);
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                ([...Colors.primaries]..shuffle()).first,
                              ),
                            ),
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Configure",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.lightGreen,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Cancel daily',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        Icon(
                          Icons.high_quality_outlined,
                          color: Colors.lightGreen,
                        ),
                        Text(
                          'Price-quality ${insurance.priceQuality}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        Icon(
                          Icons.last_page_outlined,
                          color: Colors.lightGreen,
                        ),
                        Text(
                          '${insurance.withVensyanPrice}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Center(
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              insurance.selected = !insurance.selected;
                            });
                          },
                          icon: Icon(Icons.expand_more),
                          label: Text("More information"),
                        ),
                      ),
                    ),
                    Collapsible(
                      maintainState: true,
                      collapsed: insurance.selected ? false : true,
                      axis: CollapsibleAxis.vertical,
                      curve: Curves.easeInOutSine,
                      duration: Duration(seconds: 1),
                      alignment: Alignment.topCenter,
                      child: _moreInformation(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
