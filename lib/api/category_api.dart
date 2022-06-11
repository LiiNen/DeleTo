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

var definedCategory = [6, 8, 9, 1, 19, 5, 20, 15, 4, 12, 14, 16];
List<Category> _imageCategory = List.generate(definedCategory.length, (index) => Category(id: 0, name: 'null'));
List<Category> _noImageCategory = [];

setCategory(dynamic _categoryList) {
  for(var i=0; i < _categoryList.length; i++) {
    var _index = definedCategory.indexOf(_categoryList[i]['id']);
    if(_index != -1) {
      _imageCategory[_index] = Category(id: _categoryList[i]['id'], name: _categoryList[i]['name']);
    }
    else {
      _noImageCategory.add(Category(id: _categoryList[i]['id'], name: _categoryList[i]['name']));
    }
  }
  categoryList = _imageCategory + _noImageCategory;
}