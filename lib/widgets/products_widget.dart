import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  //const ProductsWidget({Key? key}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
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
        itemCount: 10,
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
                    height: 300.0,
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/characters-people-holding-blockchain-network_53876-43007.jpg"),
                      ),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: Colors.amber,
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
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Hello world!"),
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
