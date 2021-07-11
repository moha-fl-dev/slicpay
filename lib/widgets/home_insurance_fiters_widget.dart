import 'package:flutte/Enteties/home_insurance.dart';
import 'package:flutter/material.dart';

class HomeInsuranceFilterWidget extends StatefulWidget {
  final List<HomeInsuance> insuranceList;
  final ScrollController controller;
  final customFunction;
  const HomeInsuranceFilterWidget(
      {Key? key,
      required this.insuranceList,
      required this.controller,
      required this.customFunction})
      : super(key: key);

  @override
  _HomeInsuranceFilterWidgetState createState() =>
      _HomeInsuranceFilterWidgetState();
}

class _HomeInsuranceFilterWidgetState extends State<HomeInsuranceFilterWidget> {
  bool selected = false;
  int filtercount = 0;

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final insurance = widget.insuranceList;
    return SingleChildScrollView(
      controller: controller,
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Container(
                  width: 50.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: insurance.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final insuranceProvider = insurance[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        insuranceProvider.selected =
                            !insuranceProvider.selected;
                        filtercount++;
                        widget.customFunction(filtercount);
                      });
                    },
                    child: Container(
                      width: 80.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: insuranceProvider.selected
                                ? Colors.blueAccent
                                : Colors.grey[300]!,
                            width: insuranceProvider.selected ? 5.0 : 1.0,
                          ),
                        ),
                      ),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.contain,
                        placeholder: "assets/loading_gif.gif",
                        image: insuranceProvider.logo,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
