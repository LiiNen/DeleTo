import 'package:delito/object/board.dart';

getBoardList(json) {
  return List.generate(json, (index) {
    var _temp = json[index];
    return Board(id: _temp['id'], shopName: _temp['shopName'], title: _temp['title'], curNum: _temp['curNum'], maxNum: _temp['maxNum']);
  });
}