import 'dart:convert';
import 'package:flutte/Enteties/contracts.dart';
import 'package:flutte/widgets/energie_widget.dart';
import 'package:flutte/widgets/insurance_widget.dart';
import 'package:flutte/widgets/mobile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  _ContractsScreenState createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  late Contracts contracts;
  List<Contracts> contracList = [];

  @override
  void initState() {
    super.initState();
    loadContracts();
  }

  IconData getCustomIcon(String type) {
    IconData icon = IconData(0xe14a, fontFamily: 'MaterialIcons'); // wifi

    switch (type) {
      case "mobile":
        icon = IconData(0xe14a, fontFamily: 'MaterialIcons'); // wifi
        break;
      case "energie":
        icon = IconData(0xe0ee, fontFamily: 'MaterialIcons'); // bolt
        break;
      case "insurance":
        icon = IconData(0xe596, fontFamily: 'MaterialIcons'); // shield
    }

    return icon;
  }

  // void bottomSheetBuilder(context) {
  //   showBottomSheet(
  //       context: context, builder: (context) => buildBottomSheet(context));
  // }

  Future<String> loadContractsFromAssets() async {
    return await rootBundle.loadString("assets/companies.json");
  }

  Future<void> loadContracts() async {
    String jsonString = await loadContractsFromAssets();

    List<dynamic> response = json.decode(jsonString);

    Contracts testContract = new Contracts.fromJson(response[0]);

    setState(() {
      contracts = testContract;

      response.forEach((element) {
        contracList.add(new Contracts.fromJson(element));
      });
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

  Widget productTypeWidget(String type, Contracts contracts) {
    late Widget widget;

    switch (type) {
      case "mobile":
        widget = MobileWidget(contracts: contracts);
        break;
      case "energie":
        widget = EnergieWiget(contracts: contracts);
        break;
      case "insurance":
        widget = InsuranceWidget(contracts: contracts);
        break;
      default:
        print("Defaulted");
    }

    return widget;
  }

  Widget buildBottomSheet(context, contracList) {
    Widget widgetType = productTypeWidget(contracList.type, contracList);

    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 1,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            color: Colors.grey[100],
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  width: 50.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    // border: Border.all(
                    //   color: Colors.grey[350]!,
                    // ),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  contracList.logo.toString(),
                  fit: BoxFit.contain,
                  height: 100.0,
                  width: 100.0,
                  //color: ([...Colors.primaries]..shuffle()).first,
                ),
              ),
              widgetType,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white10,
        title: Container(
          child: Center(
            child: Text(
              "Contracts",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: contracList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Text(
                  contracList[index].companyName.toString(),
                ),
                subtitle: Text(
                  "${contracList[index].productName} - ${contracList[index].price} P/M",
                ),
                leading: SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: ([...Colors.primaries]..shuffle()).first,
                    highlightColor: ([...Colors.primaries]..shuffle()).first,
                    child: Icon(
                      getCustomIcon(contracList[index].type.toString()),
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 10.0,
                ),
                onTap: () {
                  print(contracList[index].type);

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        buildBottomSheet(context, contracList[index]),
                  );

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MobileWidget(
                  //       contracts: contracList[index],
                  //     ),
                  //   ),
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
