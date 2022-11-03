import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyAPI extends GetConnect {
  final String _baseUrl = "http://localhost:5000/api";
  // ignore: prefer_typing_uninitialized_variables
  var response;

  // User Authenticatiom
  Future<Response> authenticateUser(Map data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  Future<Response> registerUser(Map data, String endpoint) =>
      post(_baseUrl + endpoint, jsonEncode(data));

  //Get Assessment Questions
  Future<Response> getQuestions(data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  _setHeaders() =>
      {'content-type': 'application/json', 'accept': 'application/json'};
}
