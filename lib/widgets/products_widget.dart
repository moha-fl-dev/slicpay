import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  //const ProductsWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  List<String> prices = [
    "15.99-,",
    "40.00-,",
    "15,99-,",
    "70.00-,",
    "29.00-,",
    "40.00-,",
    "15,99-,"
  ];

  final List<String> imgList = [
    "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/campagnes/juni-2021/iPhone-12-Pro-Banner.png.transform/w742/high/img.png",
    "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/telefoon/samsung/s21/S21+5G-VersionA.png.transform/w1240/high/img.png",
    "https://www.t-mobile.nl/Consumer/media/images/_thuis/campagne/wake-up-mei-2021/v3/hc-fg-c_2P_ThuisSale_Promo-NU__560x420_JS_v1.png",
    "https://www.t-mobile.nl/Consumer/media/images/_campagne/go-go-go/april-2021/swirl-nieuw/hc-fg-c_GGGD_Q2_KV_560x420.png",
    "https://www.t-mobile.nl/Consumer/media/images/_thuis/klantvoordeel/D_2021-0118_TMO_hc-fg-c_T-MobileMobiel_T-Mobile-Thuis_560x420_JS_V4.png",
    "https://www.seekpng.com/png/full/208-2081498_health-monitors-prevention-health-insurance-icon-png.png",
    "https://www.seekpng.com/png/full/366-3662198_auto-insurance-icon-motor-insurance-icon.png",
  ];

  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam feugiat ante vitae volutpat eleifend. Vivamus sagittis elementum fringilla. Fusce venenatis metus porttitor, lacinia est et, scelerisque lorem. Integer quis diam eget diam accumsan tristique ac eu nunc. Cras hendrerit iaculis arcu, eget consequat ipsum pellentesque eu. Vivamus massa mi, dignissim a eleifend id, mollis quis felis. Sed laoreet libero nec mauris facilisis hendrerit. Sed tristique magna eu mattis tempus.";

  @override
  void initState() {
    super.initState();
    setState(() {
      imgList.shuffle();
      prices.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 5.0,
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("hereeeeee");
            },
            highlightColor: ([...Colors.primaries]..shuffle()).first,
            hoverColor: ([...Colors.primaries]..shuffle()).first,
            focusColor: ([...Colors.primaries]..shuffle()).first,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 400.0,
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(imgList[index].toString()),
                      ),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: ([...Colors.primaries]..shuffle()).first,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //child: Text("Hello world"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5.0,
                        color: Colors.grey[200]!,
                      ),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10.0),
                    height: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              text,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.trending_up_outlined,
                                size: 40.0,
                                color: Colors.greenAccent,
                              ),
                              Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    print("Inkwell star");
                                  },
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 40.0,
                                    color: ([...Colors.primaries]..shuffle())
                                        .first,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  prices[index],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: ([...Colors.primaries]..shuffle())
                                        .first,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          // Stack(
          //   children: [
          //     Positioned(
          //       child: Container(
          //         margin: EdgeInsets.all(10.0),
          //         width: double.infinity,
          //         child: InkWell(
          //           onTap: () {
          //             print("Tapped");
          //           },
          //           child: Image(
          //             fit: BoxFit.contain,
          //             image: AssetImage(
          //                 "assets/characters-people-holding-blockchain-network_53876-43007.jpg"),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       bottom: 0,
          //       right: 0,
          //       left: 0,
          //       child: Container(
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             width: 5.0,
          //             color: Colors.grey[200]!,
          //           ),
          //           color: Colors.white,
          //         ),
          //         margin: EdgeInsets.all(10.0),
          //         height: 100.0,
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text("Hello world!"),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
