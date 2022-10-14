import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class MyAPI {
  final String _url = "http://localhost:5000/api";
  createUser(Map data, endpoint) async {
    var fullUrl = _url + endpoint;
    return await http.post(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
      body: jsonEncode(data),
    );
  }

  _setHeaders() =>
      {'content-type': 'application/json', 'accept': 'application/json'};
}
