import 'package:delito/object/shop.dart';

getShopList(json) {
  return List.generate(json, (index) {
    var _temp = json[index];
    return Shop(id: _temp['id'], shopName: _temp['shopName']);
  });
}