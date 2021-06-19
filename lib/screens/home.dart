import 'dart:async';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutte/widgets/categorie_selector.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/campagnes/juni-2021/iPhone-12-Pro-Banner.png.transform/w742/high/img.png",
    "https://d2teggvo21dk1p.cloudfront.net/content/dam/vodafone/telefoon/samsung/s21/S21+5G-VersionA.png.transform/w1240/high/img.png",
    "https://www.t-mobile.nl/Consumer/media/images/_thuis/campagne/wake-up-mei-2021/v3/hc-fg-c_2P_ThuisSale_Promo-NU__560x420_JS_v1.png",
    "https://www.t-mobile.nl/Consumer/media/images/_campagne/go-go-go/april-2021/swirl-nieuw/hc-fg-c_GGGD_Q2_KV_560x420.png",
    "https://www.t-mobile.nl/Consumer/media/images/_thuis/klantvoordeel/D_2021-0118_TMO_hc-fg-c_T-MobileMobiel_T-Mobile-Thuis_560x420_JS_V4.png",
    "https://www.seekpng.com/png/full/208-2081498_health-monitors-prevention-health-insurance-icon-png.png",
    "https://www.seekpng.com/png/full/366-3662198_auto-insurance-icon-motor-insurance-icon.png",
  ];
  List<String> names = ["John", "Jane", "Martin", "Martha"];

  String getRandomName() {
    return names[Random().nextInt(names.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 100.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: HexColor("#ffffff"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: HexColor("#ffffff"),
              ),
            ),
          ),
        ],
        backgroundColor: HexColor("#2c98f0"),
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Good day ${getRandomName()}",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
              color: HexColor("#ffffff"),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 0.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: CateGorieSelectro(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 10),
                    viewportFraction: 1,
                  ),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: Stack(
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    print("Tapped");
                                  },
                                  child: Image.network(
                                    i.toString(),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.white60,
                child: Center(child: Text("Rebuilding")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
