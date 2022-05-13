import 'package:delito/object/store.dart';

class Board extends Store{
  final int userId;
  final String title;
  final String content;
  final int curNum;
  final int maxNum;
  final int deliveryPrice;
  final int leastPrice;
  final bool open;
  final String time;
  final String userName;

  Board({
    required id, imgSrc='', required shopName,
    this.userId=0, required this.title, this.content='',  required this.curNum, required this.maxNum, this.deliveryPrice=0, this.leastPrice=0, this.open=true, this.time='4/3 23:00', this.userName='딜리투계정',
    lat=0.0, lng=0.0
  }) : super(id: id, imgSrc: imgSrc, shopName: shopName, lat: lat, lng: lng);
}

var testBoardList = [
  Board(id: 1, title: '치킨먹을 사람?', shopName: '아주대학교 KFC', curNum: 3, maxNum: 6, content: '5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ', deliveryPrice: 5000, leastPrice: 12000),
  Board(id: 2, title: '배달비 아낄사람', shopName: '피자브라더스 인계본점', curNum: 4, maxNum: 5, open: false),
  Board(id: 3, title: '광교관 여학생 있음?', shopName: '신전떡볶이 아주대점', curNum: 4, maxNum: 4),
  Board(id: 4, title: '본인 팔달관 망령', shopName: '맘스터치 광교점', curNum: 3, maxNum: 4),
  Board(id: 5, title: '남제 1명 구함', shopName: '맥도날드 아주대점', curNum: 1, maxNum: 2),
];