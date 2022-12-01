import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyAPI extends GetConnect {
  // base Web and Desktop URL
  final String _baseUrl = "http://127.0.0.1:5000/api";

  // base Emulator URL
  final String _baseEMUrl = "http://10.0.2.2:5000/api";

  // base Web and Desktop Url
  final String _baseRealDeviceUrl = "http://192.168.120.46:5000/api";

  // ignore: prefer_typing_uninitialized_variables
  var response;

  // User Authentication
  Future<Response> authenticateUser(Map data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  Future<Response> registerUser(Map data, String endpoint) =>
      post(_baseUrl + endpoint, jsonEncode(data));

  //Get Assessment Questions
  Future<Response> getQuestions(data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  //checking project ID
  Future<Response> getProjectID(String id, String endpoint) =>
      get("$_baseUrl$endpoint$id");
//creating payments in the database
  Future<Response> createPayment(Map data, String endpoint) =>
      post(_baseUrl + endpoint, data);
// creating assessments in the database
  Future<Response> createAssessment(data, String endpoint) =>
      post(_baseUrl + endpoint, data);

  Future<Response> fetchSensorData(String endpoint) => get(_baseUrl + endpoint);
}
