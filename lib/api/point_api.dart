import 'dart:convert';

import 'package:delito/object/point.dart';
import 'package:delito/object/user.dart';

import 'api_config.dart';
import 'package:http/http.dart' as http;

getPointList({required int pageNum, required int lastPoint}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathUser$pathPoint?user_id=${userInfo.id}&page_num=$pageNum'));
  num _lastPoint = lastPoint;

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      var _tempPoint = _lastPoint;
      _lastPoint = _tempPoint - _temp['amount'];
      return Point(
        userId: userInfo.id,
        left: _tempPoint.toInt(),
        amount: (_temp['amount']).abs(),
        time: _temp['created_at'],
        title: _temp['content'],
        isCharge: _temp['amount'] > 0
      );
    });
  }
  return null;
}