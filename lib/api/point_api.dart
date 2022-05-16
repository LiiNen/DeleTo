import 'package:delito/object/point.dart';

getPointList(json) {
  return List.generate(json, (index) {
    var _temp = json[index];
    return Point(userId: _temp['userId'], left: _temp['left'], amount: _temp['amount'], time: _temp['time'], title: _temp['title']);
  });
}