import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:task_getx/network/networkresponse.dart';



class Networkcall {
  static Future<Networkresponse> getRequest(String url) async {
    try {
      Response response = await get(
          Uri.parse(url),
          headers: {}
      );
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        return Networkresponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        // Handle unauthorized response if needed
      } else {
        return Networkresponse(false, response.statusCode, null);
      }
    } catch (e) {
      log('Error: $e');
    }
    return Networkresponse(false, -1, null);
  }
}
