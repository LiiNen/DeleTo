import 'package:delito/object/store.dart';

class Board extends Store{
  final int userId;
  final String title;
  final String content;
  final int curNum;
  final int maxNum;
  final int deliveryPrice;
  final int leastPrice;
  bool open;
  bool isComplete;
  final String time;
  final String userName;

  Board({
    required id, imgUrl='', required shopName,
    this.userId=0, required this.title, this.content='',  required this.curNum, required this.maxNum, this.deliveryPrice=0, this.leastPrice=0, this.open=true, this.time='4/3 23:00', this.userName='딜리투계정', this.isComplete=false,
    lat=0.0, lng=0.0
  }) : super(id: id, imgUrl: imgUrl, shopName: shopName, lat: lat, lng: lng);
}

var testBoardList = [
  Board(id: 1, title: '쌀국수가 조아', shopName: '쌀국수먹자-본점', curNum: 3, maxNum: 6, content: '5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ', deliveryPrice: 2000, leastPrice: 10000, imgUrl: 'https://rev-static.yogiyo.co.kr/restaurant_logos/업체자체_20201102_468209_쌀국수먹자-본점_대표사진_300x300.jpg'),
  Board(id: 2, title: '배달비 아낄사람', userId: 1, shopName: '피자헛-수원지동점', curNum: 4, maxNum: 5, open: false, imgUrl: 'https://rev-static.yogiyo.co.kr/franchise_logos/피자헛_20170612_Franchise이미지약정서_crop_200x200.jpg'),
  Board(id: 3, title: '광교관 여학생 있음?', shopName: '신전떡볶이 아주대점', curNum: 4, maxNum: 4),
  Board(id: 4, title: '본인 팔달관 망령', shopName: '맘스터치 광교점', curNum: 3, maxNum: 4),
  Board(id: 5, title: '남제 1명 구함', shopName: '맥도날드 아주대점', curNum: 1, maxNum: 2),
];