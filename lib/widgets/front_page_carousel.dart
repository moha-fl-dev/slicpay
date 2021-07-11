import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CrouselText {
  String? imageUrl;
  String? value;

  CrouselText({this.imageUrl, this.value});
}

class PageCrousel extends StatefulWidget {
  @override
  _PageCrouselState createState() => _PageCrouselState();
}

class _PageCrouselState extends State<PageCrousel> {
  late List<CrouselText> crousel;

  @override
  void initState() {
    super.initState();
    setState(() {
      crousel = _crousel();
    });
  }

  List<CrouselText> _crousel() {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    final List<String> text = [
      'Vodafone',
      'T-mobile',
      'Tele2',
      'Virgin',
      'VattenFall',
      'Eneco'
    ];

    List<CrouselText> crouselText = [];

    for (int i = 0; i < imgList.length; i++) {
      crouselText.add(CrouselText(imageUrl: imgList[i], value: text[i]));
    }

    return crouselText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 900),
          autoPlayCurve: Curves.linearToEaseOut,
          enlargeCenterPage: false,
        ),
        items: crousel.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 370,
                height: 200,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Ink.image(
                        image: NetworkImage(item.imageUrl.toString()),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () => {
                            print('hello world'),
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.value.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                    color: ([...Colors.primaries]..shuffle())
                                        .first,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Get the latest prices from ${item.value}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                    color: ([...Colors.primaries]..shuffle())
                                        .first,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
