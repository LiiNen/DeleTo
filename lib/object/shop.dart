import 'package:delito/object/store.dart';

class Shop extends Store{
  final int deliveryPrice;
  final int leastPrice;
  final String openTime;
  final String closeTime;

  Shop({
    required id, imgSrc='', required shopName,
    this.deliveryPrice=0, this.leastPrice=0,
    this.openTime='09:00', this.closeTime='23:00',
  }) : super(id: id, imgSrc: imgSrc, shopName: shopName);
}

var testShopList = [
  Shop(id: 1, shopName: '아주대학교 KFC', deliveryPrice: 5000, leastPrice: 12000),
  Shop(id: 2, shopName: '피자브라더스 인계본점', openTime: '17:00', closeTime: '02:00'),
  Shop(id: 3, shopName: '신전떡볶이 아주대점',),
  Shop(id: 4, shopName: '맘스터치 광교점',),
  Shop(id: 5, shopName: '맥도날드 아주대점',),
];
