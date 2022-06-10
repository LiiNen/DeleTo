import 'dart:convert';

import 'package:delito/object/user.dart';

import 'api_config.dart';
import 'package:http/http.dart' as http;

postReport({String title='temp', required String content, required String email, targetId=0, required String targetUserName}) async {
  var reportBody = Map();
  reportBody['user_id'] = userInfo.id;
  reportBody['title'] = title;
  reportBody['content'] = content;
  reportBody['email'] = email;
  reportBody['target_id'] = targetId;
  reportBody['target_user_name'] = targetUserName;
  var requestBody = Map();
  requestBody['report'] = reportBody;

  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(
    Uri.parse('$requestUrl$pathReport'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return true;
  }
  return false;
}