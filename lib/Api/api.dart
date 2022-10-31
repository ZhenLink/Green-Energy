import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyAPI extends GetConnect {
  final String _baseUrl = "http://localhost:5000/api";
  // ignore: prefer_typing_uninitialized_variables
  var response;

  Future<Response> authenticateUser(Map data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  Future createUser(Map data, endpoint) async {
    try {
      var fullUrl = _baseUrl + endpoint;
      var response = await http.post(
        Uri.parse(fullUrl),
        headers: _setHeaders(),
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        return response.body;
      } else {
        //error message
        return response.reasonPhrase;
      }
    } catch (err) {
      return err;
    }
  }

  _setHeaders() =>
      {'content-type': 'application/json', 'accept': 'application/json'};
}
