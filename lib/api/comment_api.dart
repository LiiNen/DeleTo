import 'dart:convert';

import 'package:delito/object/user.dart';

import 'api_config.dart';
import 'package:http/http.dart' as http;
import 'package:delito/object/comment.dart';

getCommentByBoardId({required int boardId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathComment$pathBoard?post_id=$boardId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      return Comment(userId: _temp['id'], userName: _temp['name'], imgUrl: '', content: _temp['content'], time: _temp['created_at']);
    });
  }
  return null;
}

getCommentByUser({required int userId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathComment$pathUser?user_id=$userId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      return Comment(userId: userId, userName: userInfo.name, imgUrl: '', content: _temp['content'], time: _temp['created_at'], boardId: _temp['post_id']);
    });
  }
  return null;
}

postComment({required int boardId, required String content}) async {
  var requestBody = Map();
  requestBody['user_id'] = userInfo.id;
  requestBody['content'] = content;
  requestBody['post_id'] = boardId;

  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(
    Uri.parse('$requestUrl$pathComment'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );

  if(response.statusCode == 200) {
    return true;
  }
  return false;
}
