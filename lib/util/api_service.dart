import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> apiService(String endpoint) async {
  var url = "https://demo.lazday.com/rest-api-sample/$endpoint";
  var response = await http.get(url);
  return json.decode(response.body);
}