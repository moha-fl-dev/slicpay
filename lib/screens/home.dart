import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutte/Enteties/new_partners.dart';
import 'package:flutte/widgets/categorie_selector.dart';
import 'package:flutte/widgets/find_more_widget.dart';
import 'package:flutte/widgets/yellow_center_item_widget.dart';
import 'package:flutte/widgets/products_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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

  List<Partners> partnersList = [];

  String getRandomName() {
    return names[Random().nextInt(names.length)];
  }

  @override
  void initState() {
    super.initState();

    loadPartners();
  }

  Future<String> loadPartnersFromAssets() async {
    return await rootBundle.loadString("assets/partners.json");
  }

  Future<void> loadPartners() async {
    String jsonString = await loadPartnersFromAssets();

    List<dynamic> response = json.decode(jsonString);

    setState(() {
      response.forEach((element) {
        partnersList.add(new Partners.fromJson(element));
      });
    });
  }

  Widget buildPartners(String img) {
    return Container(
      width: 175.0,
      child: Card(
        color: Colors.grey[100],
        elevation: 0.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(img),
              ),
            ),
            ButtonTheme(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('Show More'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[HexColor("#B597F6"), HexColor("#96C6EA")],
            ),
          ),
        ),
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
              ProductsWidget(),
              SizedBox(
                height: 10.0,
              ),
              FeaturedWidget(),
              SizedBox(
                height: 20.0,
              ),
              FindMoreWidget(),
              SizedBox(
                height: 20.0,
              ),
              ProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
