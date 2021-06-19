import 'dart:convert';

import 'package:flutte/Enteties/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalDetailWidget extends StatefulWidget {
  const PersonalDetailWidget({Key? key}) : super(key: key);

  @override
  _PersonalDetailWidgetState createState() => _PersonalDetailWidgetState();
}

class _PersonalDetailWidgetState extends State<PersonalDetailWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            user.name.toString(),
          )
        ],
      ),
    );
  }
}
