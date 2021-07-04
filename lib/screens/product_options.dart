import 'package:flutte/Enteties/product.dart';
import 'package:flutte/widgets/smart_phone_contracts.dart';
import 'package:flutte/widgets/smart_phone_contracts_body_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../customScroll.dart';

class ProductOptionsScreen extends StatefulWidget {
  final Product product;
  final Color imageBackgroundColor;
  const ProductOptionsScreen(
      {Key? key, required this.product, required this.imageBackgroundColor})
      : super(key: key);

  @override
  _ProductOptionsScreenState createState() => _ProductOptionsScreenState();
}

class _ProductOptionsScreenState extends State<ProductOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final appBarColor = widget.imageBackgroundColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              leading: IconButton(
                color: appBarColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_outlined,
                ),
              ),
              expandedHeight: 60.0,
              flexibleSpace: FlexibleSpaceBar(
                // background: Container(
                //   decoration: BoxDecoration(
                //     color: appBarColor,
                //     image: DecorationImage(
                //       fit: BoxFit.contain,
                //       image: NetworkImage(
                //         product.image.toString(),
                //       ),
                //     ),
                //   ),
                // ),
                centerTitle: true,
                title: Text(
                  "Smart phone contracts",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: appBarColor,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SmartPhoneContracts(
                parentColor: appBarColor,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10.0),
            ),
            SmartPhoneContractsBody(),
          ],
        ),
      ),
    );
  }
}
