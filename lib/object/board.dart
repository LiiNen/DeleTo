import 'package:delito/object/store.dart';

class Board extends Store{
  final int userId;
  final String title;
  final String content;
  final int curNum;
  final int maxNum;
  final int deliveryPrice;
  final int leastPrice;
  bool isComplete;
  final String time;
  final String userName;
  final int boardId;

  Board({
    required id, imgUrl='', required shopName,
    this.userId=1, required this.title, this.content='',  required this.curNum, required this.maxNum, this.deliveryPrice=0, this.leastPrice=0, this.time='4/3 23:00', this.userName='딜리투계정', this.isComplete=false,
    lat=0.0, lng=0.0, required this.boardId,
  }) : super(id: id, imgUrl: imgUrl, shopName: shopName, lat: lat, lng: lng);
}