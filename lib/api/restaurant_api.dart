import 'dart:convert';

import 'package:delito/api/api_config.dart';
import 'package:delito/object/restaurant.dart';
import 'package:http/http.dart' as http;

getRestListByPage({required int categoryId, required int pageNum}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathRestaurant$pathCategory?category_id=$categoryId&pageNum=$pageNum'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      return Restaurant(
        id: _temp['id'],
        shopName: _temp['name'],
        leastPrice: _temp['min_order_amount'],
        deliveryPrice: int.parse(_temp['delivery_fee']),
        openTime: _temp['begin'].substring(0, 5),
        closeTime: _temp['end'].substring(0, 5),
        phone: _temp['phone'],
        address: _temp['address'],
        imgUrl: _temp['url'],
        lat: _temp['lat'],
        lng: _temp['lng'],
        reviewAverage: _temp['review_avg'].toDouble(),
      );
    });
  }
  else return null;
}