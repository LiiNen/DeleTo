import 'dart:convert';

import 'package:delito/api/api_config.dart';
import 'package:delito/object/menu.dart';
import 'package:delito/object/restaurant.dart';
import 'package:http/http.dart' as http;

getRestListByPage({required int categoryId, required int pageNum}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathRestaurant$pathCategory?category_id=$categoryId&page_num=$pageNum'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return List.generate(responseBody.length, (index) {
      var _temp = responseBody[index];
      var _categories = _temp['categories'][0]['name'];
      for(var i = 1; i < _temp['categories'].length; i++) {
        _categories = _categories + ', ' + _temp['categories'][i]['name'].toString();
      }
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
        categories: _categories
      );
    });
  }
  else return null;
}

getRestDetail({required int restId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathRestaurant$pathInfo?restaurant_id=$restId'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    var _temp = responseBody[0];
    var _menu = responseBody[1];
    return Restaurant(
      id: restId,
      shopName: _temp['name'],
      deliveryPrice: int.parse(_temp['delivery_fee']),
      leastPrice: _temp['min_order_amount'],
      deliveryTime: _temp['delivery_time'],
      openTime: _temp['begin'].substring(0,5),
      closeTime: _temp['end'].substring(0,5),
      phone: _temp['phone'],
      address: _temp['address'],
      imgUrl: _temp['url'],
      lat: _temp['lat'],
      lng: _temp['lng'],
      reviewAverage: _temp['review_avg'].toDouble(),
      menuList: List.generate(_menu.length, (index) {
        return Menu(
          name: _menu[index]['name'],
          price: _menu[index]['price'],
          imgUrl: _menu[index]['url'],
        );
      })
    );
  }
  return null;
}