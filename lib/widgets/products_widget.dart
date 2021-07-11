// import 'package:flutter/material.dart';

// class ProductsWidget extends StatefulWidget {
//   //const ProductsWidget({Key? key}) : super(key: key);

//   @override
//   _ProductsWidgetState createState() => _ProductsWidgetState();
// }

// class _ProductsWidgetState extends State<ProductsWidget> {
//   List<String> prices = [
//     "15.99-,",
//     "40.00-,",
//     "15,99-,",
//     "70.00-,",
//     "29.00-,",
//     "40.00-,",
//     "15,99-,"
//   ];

//   final List<String> imgList = [
//     "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/campagnes/juni-2021/iPhone-12-Pro-Banner.png.transform/w742/high/img.png",
//     "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/telefoon/samsung/s21/S21+5G-VersionA.png.transform/w1240/high/img.png",
//     "https://www.t-mobile.nl/Consumer/media/images/_thuis/campagne/wake-up-mei-2021/v3/hc-fg-c_2P_ThuisSale_Promo-NU__560x420_JS_v1.png",
//     "https://www.t-mobile.nl/Consumer/media/images/_campagne/go-go-go/april-2021/swirl-nieuw/hc-fg-c_GGGD_Q2_KV_560x420.png",
//     "https://www.t-mobile.nl/Consumer/media/images/_thuis/klantvoordeel/D_2021-0118_TMO_hc-fg-c_T-MobileMobiel_T-Mobile-Thuis_560x420_JS_V4.png",
//     "https://www.seekpng.com/png/full/208-2081498_health-monitors-prevention-health-insurance-icon-png.png",
//     "https://www.seekpng.com/png/full/366-3662198_auto-insurance-icon-motor-insurance-icon.png",
//   ];

//   String text =
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam feugiat ante vitae volutpat eleifend. Vivamus sagittis elementum fringilla. Fusce venenatis metus porttitor, lacinia est et, scelerisque lorem. Integer quis diam eget diam accumsan tristique ac eu nunc. Cras hendrerit iaculis arcu, eget consequat ipsum pellentesque eu. Vivamus massa mi, dignissim a eleifend id, mollis quis felis. Sed laoreet libero nec mauris facilisis hendrerit. Sed tristique magna eu mattis tempus.";

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       imgList.shuffle();
//       prices.shuffle();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             width: 5.0,
//             color: Colors.grey[200]!,
//           ),
//         ),
//       ),
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: imgList.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               print("hereeeeee");
//             },
//             highlightColor: ([...Colors.primaries]..shuffle()).first,
//             hoverColor: ([...Colors.primaries]..shuffle()).first,
//             focusColor: ([...Colors.primaries]..shuffle()).first,
//             child: Stack(
//               children: [
//                 Positioned(
//                   child: Container(
//                     height: 400.0,
//                     margin: EdgeInsets.all(10.0),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.contain,
//                         image: NetworkImage(imgList[index].toString()),
//                       ),
//                       border: Border.all(
//                         color: Colors.transparent,
//                       ),
//                       color: ([...Colors.primaries]..shuffle()).first,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     //child: Text("Hello world"),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   left: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 5.0,
//                         color: Colors.grey[200]!,
//                       ),
//                       color: Colors.white,
//                     ),
//                     margin: EdgeInsets.all(10.0),
//                     height: 150.0,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               text,
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: false,
//                               maxLines: 3,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(
//                                 Icons.trending_up_outlined,
//                                 size: 40.0,
//                                 color: Colors.greenAccent,
//                               ),
//                               Material(
//                                 color: Colors.white,
//                                 child: InkWell(
//                                   onTap: () {
//                                     print("Inkwell star");
//                                   },
//                                   child: Icon(
//                                     Icons.favorite_border,
//                                     size: 40.0,
//                                     color: ([...Colors.primaries]..shuffle())
//                                         .first,
//                                   ),
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   prices[index],
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                     color: ([...Colors.primaries]..shuffle())
//                                         .first,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );

//           // Stack(
//           //   children: [
//           //     Positioned(
//           //       child: Container(
//           //         margin: EdgeInsets.all(10.0),
//           //         width: double.infinity,
//           //         child: InkWell(
//           //           onTap: () {
//           //             print("Tapped");
//           //           },
//           //           child: Image(
//           //             fit: BoxFit.contain,
//           //             image: AssetImage(
//           //                 "assets/characters-people-holding-blockchain-network_53876-43007.jpg"),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //     Positioned(
//           //       bottom: 0,
//           //       right: 0,
//           //       left: 0,
//           //       child: Container(
//           //         decoration: BoxDecoration(
//           //           border: Border.all(
//           //             width: 5.0,
//           //             color: Colors.grey[200]!,
//           //           ),
//           //           color: Colors.white,
//           //         ),
//           //         margin: EdgeInsets.all(10.0),
//           //         height: 100.0,
//           //         child: Padding(
//           //           padding: const EdgeInsets.all(8.0),
//           //           child: Text("Hello world!"),
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:math';
import 'package:flutte/Enteties/product.dart';
import 'package:flutte/screens/mobile_product_options.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Product>>(
        future: ProductsApi.getProductsLocally(context),
        builder: (context, snapShot) {
          final product = snapShot.data;

          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );

            default:
              if (snapShot.hasError) {
                return Center(
                  child: Text("Oeps! Error occured."),
                );
              } else {
                return buildProducts(product!);
              }
          }
        },
      ),
    );
  }

  Widget buildProducts(List<Product> products) => ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final product = products[index];
          final imageBackgroundColor = ([...Colors.primaries]..shuffle()).first;
          return InkWell(
            splashColor: ([...Colors.primaries]..shuffle()).first,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductOptionsScreen(
                    product: product,
                    imageBackgroundColor: imageBackgroundColor,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 15.0,
                    color: Colors.grey[200]!,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              height: 550.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 1,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: imageBackgroundColor,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          product.image.toString(),
                        ),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(""),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        product.trending!
                            ? Icon(
                                Icons.trending_up,
                                size: 30.0,
                                color: Colors.green,
                              )
                            : Text(
                                "Brought to you by ${product.companyName}",
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                        product.trending!
                            ? Text(
                                " Trending",
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Text(
                      product.name.toString(),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Text(
                      product.description.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price 12 months",
                          style: TextStyle(
                            color: Colors.lightGreen,
                          ),
                        ),
                        Text(
                          "€ ${product.price1year}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print(product.name);
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent[400],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print(product.name);
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.deepPurpleAccent,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    child: Text(
                      "${Random().nextInt(2000).toString()} + bought",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

class ProductsApi {
  static Future<List<Product>> getProductsLocally(
      BuildContext buildContext) async {
    final assetBundel = DefaultAssetBundle.of(buildContext);

    final data = await assetBundel.loadString("assets/product.json");

    final body = json.decode(data);

    return body.map<Product>(Product.fromJson).toList();
  }
}
