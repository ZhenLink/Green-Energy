import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class MyAPI {
  final String _url = "http://localhost:5000/api";

  Future createUser(Map data, endpoint) async {
    try {
      var fullUrl = _url + endpoint;
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
