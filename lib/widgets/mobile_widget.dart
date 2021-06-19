import 'dart:math';

import 'package:flutte/Enteties/contracts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MobileWidget extends StatefulWidget {
  final Contracts contracts;

  const MobileWidget({Key? key, required this.contracts}) : super(key: key);

  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  int randomNumber = Random().nextInt(10);

  Widget buildProductInfoPage(Contracts contracts) {
    return DataTable(
      columnSpacing: 70.0,
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Data',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Calls',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                contracts.productName.toString(),
              ),
            ),
            DataCell(
              Text(
                contracts.contents!.data.toString(),
              ),
            ),
            DataCell(
              Text(
                contracts.contents!.calls.toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDatesDataTable(Contracts contracts) {
    return Center(
      child: DataTable(
        columnSpacing: 40.0,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Start',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'End',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Remaining',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text(
                  contracts.startDate.toString(),
                ),
              ),
              DataCell(
                Text(
                  contracts.endDate.toString(),
                ),
              ),
              DataCell(
                Text("2 Month(s)"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildUsageWidget(Contracts contracts) {
    return Wrap(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.max,

      runSpacing: 10.0,
      spacing: 10.0,
      children: <Widget>[
        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      //contracts.productName.toString(),
                      "Data",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      contracts.contents!.data.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   //color: ([...Colors.primaries]..shuffle()).first,
                        //   width: 1.5,
                        // ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple,
                              Colors.purple,
                              Colors.blue,
                            ],
                            stops: [
                              0,
                              0.5,
                              0.5
                            ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(300),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "1.5 GB / ${contracts.contents!.data}",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //////////calls
        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Calls/Sms",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "${contracts.contents!.calls}inutes",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   //color: ([...Colors.primaries]..shuffle()).first,
                        //   width: 1.5,
                        // ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple,
                              Colors.purple,
                              Colors.blue,
                            ],
                            stops: [
                              0,
                              0.2,
                              0.2
                            ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(300),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "131 M / ${contracts.contents!.calls}",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Extra costs",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Current month",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 130.0,
                    ),
                    Container(
                      child: Text(
                        "\$ 2,70",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Days",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Till renewal",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                              color: ([...Colors.primaries]..shuffle()).first,
                            ),
                            width: 60.0,
                            height: 100.0,
                            // color: Colors.amber,
                            child: Center(
                              child: Text(
                                Random().nextInt(10).toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            width: 60.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                              color: ([...Colors.primaries]..shuffle()).first,
                            ),
                            child: Center(
                              child: Text(
                                Random().nextInt(10).toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Cost",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Monthly",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 130.0,
                    ),
                    Container(
                      child: Text(
                        "${contracts.price} ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      ".............",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            contracts.startDate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_downward,
                            size: 30.0,
                            color: ([...Colors.primaries]..shuffle()).first,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: Text(
                            contracts.endDate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Shimmer.fromColors(
                            baseColor: ([...Colors.primaries]..shuffle()).first,
                            highlightColor:
                                ([...Colors.primaries]..shuffle()).first,
                            child: Text(
                              contracts.info!.phoneNumber.toString(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 10.0),
                                ),
                                onPressed: () {},
                                child: const Text('Request new Contract'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          width: 175.0,
          height: 300.0,
          child: Card(
            // color: ([...Colors.primaries]..shuffle()).first,
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Phone",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      contracts.hasMobile!
                          ? contracts.mobile!.model.toString()
                          : "-",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      children: [
                        Container(
                          child: contracts.hasMobile!
                              ? Icon(
                                  Icons.phone_iphone,
                                  size: 50.0,
                                  color: Colors.redAccent,
                                )
                              : Icon(
                                  Icons.mobile_off,
                                  size: 50.0,
                                ),
                        ),
                        SizedBox(
                          height: 65.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 10.0),
                                ),
                                onPressed: () {},
                                child: const Text('Upgrade to new phone'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: TextButton(
            // style: TextButton.styleFrom(
            //   side: BorderSide(
            //     color: Colors.grey[300]!,
            //     width: 1.0,
            //   ),
            // ),
            onPressed: () => {
              Navigator.pop(context),
            },
            child: Shimmer.fromColors(
              baseColor: ([...Colors.primaries]..shuffle()).first,
              highlightColor: ([...Colors.primaries]..shuffle()).first,
              child: Icon(
                Icons.close,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var contracts = widget.contracts;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Center(
          //   child: Image.asset(
          //     contracts.logo.toString(),
          //     fit: BoxFit.contain,
          //     height: 100.0,
          //     width: 100.0,
          //     //color: ([...Colors.primaries]..shuffle()).first,
          //   ),
          // ),
          SizedBox(
            height: 20.0,
          ),
          buildUsageWidget(contracts),
        ],
      ),
    );
  }
}
