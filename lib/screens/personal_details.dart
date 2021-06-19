import 'dart:convert';
import 'package:flutte/Enteties/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late User user;

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  Future<String> loadPersonFromAssets() async {
    return await rootBundle.loadString("assets/user_details.json");
  }

  Future<void> loadPerson() async {
    String jsonString = await loadPersonFromAssets();

    List<dynamic> response = json.decode(jsonString);

    User testUser = new User.fromJson(response[0]);

    setState(() {
      user = testUser;
    });
  }

  // Widget _buildCustomerNUmber() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "E-mail",
  //       border: OutlineInputBorder(),
  //     ),
  //   );
  // }

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
              "Personal details",
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
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(25.0),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Customer nubmber",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.customerNumber,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "First name",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.name,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Last name",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.lastName,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Initial",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.initial,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.sex,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Date of birth",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.grey[500]),
                      enabled: false,
                      initialValue: user.dateOfBirth,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Zipcode",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.adres!.zipCode,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Street",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.adres!.street,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "State/Province",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.adres!.stateProvice,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Country",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.adres!.country,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "E-mail",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.emaldAdres,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      initialValue: user.phoneNumber,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      // color: ([...Colors.primaries]..shuffle()).first,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              ([...Colors.primaries]..shuffle()).first,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          print("User details changed");
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ([...Colors.primaries]..shuffle()).first,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
