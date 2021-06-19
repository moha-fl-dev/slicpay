import 'dart:convert';

import 'package:flutte/Enteties/user_details.dart';
import 'package:flutter/services.dart';

class UserDetailsService {
  static Future<User> getData() async {
    String jsonString = await loadFromJson();

    List<dynamic> response = json.decode(jsonString);

    User testUser = new User.fromJson(response[0]);

    return testUser;
  }

  static Future<String> loadFromJson() async {
    return await rootBundle.loadString("assets/user_details.json");
  }
}
