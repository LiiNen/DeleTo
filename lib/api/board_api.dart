import 'dart:convert';

import 'package:delito/api/api_config.dart';
import 'package:delito/object/board.dart';
import 'package:http/http.dart' as http;

getBoardListByPage({required int categoryId, required int pageNum}) {
  var requestBody = Map();
  requestBody['category'] = categoryId.toString();
  requestBody['pageNum'] = pageNum.toString();
}

getBoardList(json) {
  return List.generate(json, (index) {
    var _temp = json[index];
    return Board(id: _temp['id'], shopName: _temp['shopName'], title: _temp['title'], curNum: _temp['curNum'], maxNum: _temp['maxNum']);
  });
}

postBoard({required int deliveryPrice, required String title, required String content, required String maxNum, required int restId, required int userId, required int categoryId, required lat, required lng}) async {
  var requestBody = Map();
  var postBody = Map();

  postBody['delivery_fee'] = deliveryPrice.toString();
  postBody['title'] = title;
  postBody['content'] = content;
  postBody['mem_count'] = maxNum;
  postBody['rest_id'] = restId.toString();
  postBody['user_id'] = userId.toString();
  postBody['category_id'] = categoryId.toString();
  postBody['lat'] = lat;
  postBody['long'] = lng;
  requestBody['post'] = postBody;

  var response = await http.post(Uri.parse('$requestUrl$pathBoard'), body: requestBody);
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody['status'] == true) {
      return true;
    }
    return false;
  }
  return false;
}