/*
  random backgroundColor: ([...Colors.primaries]..shuffle()).first
  
   // {
    //     "productName": "Iphone 11 128GB",
    //     "productImage":
    //         "https://www.prijsvergelijken.nl/wp-content/plugins/prijsvergelijken/images/mobielvergelijker/phones/dvi_front_Iphone11_Zwart_305x450.png",
    //     "companyLogo":
    //         "https://bsimg.nl/assets/img/shared/providers/ben/color/h120.png",
    //     "rating": 2.8,
    //     "body":
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed nisi pellentesque, vehicula magna at, scelerisque leo. Maecenas tempor nunc vitae aliquam aliquet. Mauris sagittis lectus at sapien tempus, non posuere mi elementum. Morbi vehicula nulla quis nulla volutpat luctus. Suspendisse a facilisis nibh. Suspendisse sapien magna, accumsan vel vulputate id, sollicitudin ut massa. Vivamus malesuada tellus ut mi viverra, at dignissim velit ullamcorper.",
    //     "data": "100 GB",
    //     "callMinutes": "Unlimited",
    //     "price1Year": 70,
    //     "price2Year": 72,
    //     "trending": true,
    //     "vensyanRecomended": true
    // }


  SingleChildScrollView( ///// very important
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
             Text('Hey'),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:18,
                itemBuilder: (context,index){
                  return  Text('Some text');
                })
          ],
        ),
      ),

  Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.check),
          title: Text('TITLE'),
          subtitle: Text('SUBTITLE'),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: const Text('BTN1'),
              onPressed: () {/* ... */},
            ),
            FlatButton(
              child: const Text('BTN2'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );

    carousel builder
   // return Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 5.0),
            //   decoration: BoxDecoration(
            //     image:
            //         DecorationImage(image: NetworkImage(i.imageUrl.toString())),
            //   ),
            //   child: Text(
            //     i.value.toString(),
            //     style: TextStyle(fontSize: 16.0),
            //   ),
            // );

*/

// SliverToBoxAdapter(
//               child: Container(
//                 height: 250.0,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.grey[200]!),
//                   ),
//                 ),
//                 child: Container(
//                   margin: EdgeInsets.all(10.0),
//                   alignment: Alignment.center,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 20.0),
//                         child: Text("Data"),
//                       ),
//                       SfSlider(
//                         activeColor: appBarColor,
//                         inactiveColor: appBarColor.withOpacity(0.3),
//                         min: 0.0,
//                         max: 100.0,
//                         value: _dataRangeValue,
//                         interval: 20,
//                         showTicks: true,
//                         showLabels: true,
//                         enableTooltip: true,
//                         minorTicksPerInterval: 1,
//                         onChanged: (dynamic value) {
//                           setState(() {
//                             _dataRangeValue = value;
//                           });
//                         },
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 20.0),
//                         child: Text("Minutes"),
//                       ),
//                       SfSlider(
//                         activeColor: appBarColor,
//                         inactiveColor: appBarColor.withOpacity(0.3),
//                         min: 60.0,
//                         max: 150.0,
//                         value: _callRangeValue,
//                         interval: 20,
//                         showTicks: true,
//                         showLabels: true,
//                         enableTooltip: true,
//                         minorTicksPerInterval: 1,
//                         onChanged: (dynamic value) {
//                           setState(() {
//                             _callRangeValue = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.all(10.0),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: () {
//                       print(index.toString());
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         //color: index.isOdd ? Colors.white : Colors.grey[50],
//                         border: Border.all(color: Colors.grey[100]!),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       height: 100.0,
//                       child: Wrap(
//                         spacing: 10.0,
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             width: 60.0,
//                             height: 60.0,
//                             child: Image(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                 "https://d321nzgqqa3thf.cloudfront.net/price_comparator/nl_telecom/providers/logos/3/small_2x/3.png?1534840325",
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 60.0,
//                             height: 60.0,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "60 GB",
//                             ),
//                           ),
//                           Container(
//                             width: 60.0,
//                             height: 60.0,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "300 M",
//                             ),
//                           ),
//                           Container(
//                             width: 75.0,
//                             height: 75.0,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "2 yr contract",
//                             ),
//                           ),
//                           Container(
//                             width: 60.0,
//                             height: 60.0,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "price ${product.price1year.toString()}",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 childCount: 10,
//               ),
//             ),
