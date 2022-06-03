import 'dart:convert';

import 'package:delito/api/api_config.dart';
import 'package:delito/object/board.dart';
import 'package:http/http.dart' as http;

getBoardListByPage({required int categoryId, required int pageNum}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathBoard$pathCategory?category_id=$categoryId&page_num=$pageNum'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      return Board(
        id: _temp['restaurant_id'],
        shopName: _temp['restaurant_name'],
        title: _temp['title'],
        curNum: _temp['cur_mem'],
        maxNum: _temp['mem_count'],
        lat: _temp['lat'],
        lng: _temp['lng'],
        imgUrl: _temp['url'],
        boardId: _temp['id'],
        /// todo: front does not accept complete state
        isComplete: (_temp['is_complete'] == 1)
      );
    });
  }
  else return null;
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