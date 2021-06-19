import 'package:http/http.dart' as http;
import 'package:flutte/Enteties/partners.dart';

class Services {
  static const String url =
      "https://us-central1-slicpaydev-57f19.cloudfunctions.net/api/mobile/companies/1";

  static Future<List<Partner>> getPartner() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response == 200) {
        final List<Partner> partner = partnersFromJson(response.body);

        return partner;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
