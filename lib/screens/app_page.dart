import 'package:flutte/widgets/categorie_selector.dart';
import 'package:flutte/widgets/front_page_carousel.dart';
import 'package:flutte/widgets/partners_widget.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  _AppPage createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  String setGreeting() {
    return "Good morning";
  }

  Widget _buildBannerCard() {
    return PageCrousel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white10,
        title: Container(
          margin: EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 10.0),
          child: Text(
            "Good morning",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                _buildBannerCard(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25.0, 25.0, 0.0, 10.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                Container(
                  child: CateGorieSelectro(),
                ),
                Container(
                  child: PartnerWidget(),
                )
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: Menu(),
    );
  }
}
