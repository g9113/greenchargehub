import "dart:convert";

import "package:greenchargehub/auth/model.dart";
import "package:http/http.dart" as https;

class AuthHelper {
  static var client = https.Client();

  static Future<bool> booking(Booking model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var url = Uri.https(
        "apicodehub.vercel.app", "/api/liveevents/insertData");

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));

    if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}