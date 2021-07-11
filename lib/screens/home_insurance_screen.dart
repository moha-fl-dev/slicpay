import 'package:flutte/customScroll.dart';
import 'package:flutte/utils/home_insurance_util.dart';
import 'package:flutte/widgets/home_insurance_fiters_widget.dart';
import 'package:flutte/widgets/home_insurance_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeInsuranceScreen extends StatefulWidget {
  const HomeInsuranceScreen({Key? key}) : super(key: key);

  @override
  _HomeInsuranceScreenState createState() => _HomeInsuranceScreenState();
}

class _HomeInsuranceScreenState extends State<HomeInsuranceScreen> {
  bool _collapsed = false;

  int numOfFilters = 0;

  final insuranceData = HomeInsuranceData.getData();

  void customFunction(int filters) {
    setState(() {
      numOfFilters = filters;
    });
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget _buildSheet() {
    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, scrollController) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeInsuranceFilterWidget(
              insuranceList: insuranceData,
              controller: scrollController,
              customFunction: customFunction,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _collapsed = !_collapsed;
                      });
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: _collapsed ? Colors.red : Colors.green,
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.grey[50],
              //floating: true,
              pinned: true,
              expandedHeight: 60.0,
              leading: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: IconButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Home Insurance",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: HomeInsuranceList(
                insuranceList: insuranceData,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            isDismissible: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => _buildSheet(),
          );
        },
        label: Text('Filters ${numOfFilters.toString()}'),
        icon: const Icon(
          Icons.filter_alt_rounded,
        ),
        // backgroundColor: ([...Colors.primaries]..shuffle()).first,
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
