import 'dart:convert';

import 'package:delito/object/category.dart';

import 'api_config.dart';
import 'package:http/http.dart' as http;

getCategory() async {
  var response = await http.get(Uri.parse('$requestUrl$pathCategory'));

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody.length != 0) {
      setCategory(responseBody);
      return true;
    }
  }
  return false;
}

setCategory(dynamic _categoryList) {
  categoryList = List.generate(_categoryList.length, (index) {
    return Category(id: _categoryList[index]['id'], name: _categoryList[index]['name']);
  });
}