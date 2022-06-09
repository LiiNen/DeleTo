import 'dart:convert';

import 'package:delito/api/api_config.dart';
import 'package:delito/api/restaurant_api.dart';
import 'package:delito/api/user_api.dart';
import 'package:delito/object/board.dart';
import 'package:delito/object/restaurant.dart';
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

getBoardListByUser({required int userId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathBoard$pathUser?user_id=$userId&page_num=0'));

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

getBoardDetail({required int boardId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathBoard$pathInfo?post_id=$boardId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    var userName = await getUser(userId: responseBody['content']['user_id'], isLogin: false);
    if(userName == false) {
      return null;
    }
    var _temp = await getRestDetail(restId: responseBody['restaurant_id']);
    if(_temp == null) {
      return null;
    }
    return Board(
      id: responseBody['restaurant_id'],
      shopName: responseBody['restaurant']['name'],
      title: responseBody['title'],
      curNum: responseBody['cur_mem'],
      maxNum: responseBody['mem_count'],
      boardId: responseBody['id'],
      isComplete: responseBody['is_complete'],
      lat: responseBody['lat'],
      lng: responseBody['lng'],
      content: responseBody['content']['content'],
      deliveryPrice: int.parse(responseBody['restaurant']['delivery_fee']),
      leastPrice: responseBody['restaurant']['min_order_amount'],
      time: responseBody['createdAt'],
      userId: responseBody['content']['user_id'],
      userName: userName,
      imgUrl: _temp.imgUrl
    );
  }
  return null;
}

postBoard({required int deliveryPrice, required String title, required String content, required String maxNum, required int restId, required int userId, required lat, required lng}) async {
  var postBody = Map();
  postBody['delivery_fee'] = deliveryPrice.toString();
  postBody['title'] = title;
  postBody['content'] = content;
  postBody['mem_count'] = maxNum;
  postBody['rest_id'] = restId.toString();
  postBody['user_id'] = userId.toString();
  postBody['lat'] = lat;
  postBody['long'] = lng;
  var requestBody = Map();
  requestBody['post'] = postBody;

  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(Uri.parse('$requestUrl$pathBoard'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody['status'] == true) {
      return true;
    }
    return false;
  }
  return false;
}