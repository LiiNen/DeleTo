import 'dart:convert';
import 'dart:io';
import 'package:delito/api/api_config.dart';
import 'package:delito/object/user.dart';
import 'package:http/http.dart' as http;

getUser({required int userId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathUser?user_id=$userId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody['user'].length == 0) {
      return false;
    }
    var user = responseBody['user'][0];
    userInfo = User(id: userId, name: user['name'], point: user['point'], imgSrc: '', email: 'test@test.ac.kr');
    return true;
  }
  return false;
}
