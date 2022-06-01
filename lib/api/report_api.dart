import 'dart:convert';

import 'package:delito/object/user.dart';

import 'api_config.dart';
import 'package:http/http.dart' as http;

postReport({required String title, required String content, required String email}) async {
  var reportBody = Map();
  reportBody['user_id'] = userInfo.id;
  reportBody['title'] = title;
  reportBody['content'] = content;
  reportBody['email'] = email;
  var requestBody = Map();
  requestBody['report'] = reportBody;

  var response = await http.post(Uri.parse('$requestUrl$pathReport'), body: reportBody);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return true;
  }
  return false;
}