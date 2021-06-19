// class Partners {
//   final String companyName;

//   Partners({required this.companyName});

//   factory Partners.fromJson(Map<String, dynamic> json) {
//     return Partners(companyName: json['companyName']);
//   }
// }

import 'dart:convert';

List<Partner> partnersFromJson(String str) =>
    List<Partner>.from(json.decode(str).map((x) => Partner.fromJson(x)));

String partnersToJson(List<Partner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Partner {
  Partner({
    this.companyName,
  });

  String? companyName;

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
      };
}
