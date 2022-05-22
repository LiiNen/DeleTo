import 'dart:convert';
import 'dart:io';
import 'package:delito/api/api_config.dart';
import 'package:http/http.dart' as http;

getUser({required int userId}) async {
  Map<String, dynamic> requestBody = Map();
  requestBody['user'] = {'userId': userId.toString()};

  final Uri uri = Uri.http(requestUrl, pathUser, requestBody);
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final response = await http.get(uri, headers: headers);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
  }
  return null;
}