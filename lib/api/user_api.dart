import 'dart:convert';
import 'package:delito/api/api_config.dart';
import 'package:delito/object/user.dart';
import 'package:http/http.dart' as http;

getUser({required int userId, bool isLogin=true}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathUser?user_id=$userId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody['user'].length == 0) {
      return false;
    }
    var user = responseBody['user'][0];
    if(isLogin) {
      userInfo = User(id: userId, name: user['name'], point: user['point'], email: user['email']);
    }
    else {
      return user['name'];
    }
    return true;
  }
  return false;
}
