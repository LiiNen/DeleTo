import 'package:delito/object/comment.dart';

getCommentList(json) {
  return List.generate(json, (index) {
    var _temp = json[index];
    return Comment(userId: _temp['userId'], userName: _temp['userName'], imgUrl: _temp['imgUrl'], content: _temp['content'], time: _temp['time']);
  });
}